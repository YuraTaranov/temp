---
to: src/components/dataview/TodosListExample/TodosListExample.tsx
unless_exists: true
---
import React from 'react';
import {Alert, Text, TextInput, TouchableOpacity, View} from '@components';
import {useState, useMemo, useEffect} from '@hooks';
import {useGetTodosQuery, useUpdateTodoMutation, useDeleteTodoMutation, useAddTodoMutation, ITodo} from '@api';

const TodosListExample = () => {
  const [newTodo, setNewTodo] = useState('');

  const {data: todos, isLoading, isSuccess, isError, error, } = useGetTodosQuery(undefined, { // optional props
	pollingInterval: 2000, // makes request every 2 seconds
	refetchOnReconnect: true, // network connection
	refetchOnMountOrArgChange: true, // boolean or number (seconds)
  });

  const [addTodo, {isSuccess: isTodoAddedSuccessfully}] = useAddTodoMutation();
  const [updateTodo] = useUpdateTodoMutation();
  const [deleteTodo] = useDeleteTodoMutation();

  useEffect(() => {
    isTodoAddedSuccessfully && Alert.alert('Todo added successfully');
  }, [isTodoAddedSuccessfully]);

  const addNewTodo = () => {
    addTodo({id: new Date().getTime(), title: newTodo, completed: false});
    setNewTodo('');
  };

  const handleUpdateTodo = (todo: ITodo) => () => {
    const updatedTodo = {
      ...todo,
      completed: !todo.completed,
    };
    updateTodo(updatedTodo);
  };

  const handleDeleteTodo = (id: number) => () => {
    deleteTodo(id);
  };

  const content = useMemo(() => {
    if (isLoading) {
      return <Text>Loading...</Text>;
    } else if (isError) {
      return <Text>Error: {error instanceof Error && error.message}</Text>;
    } else if (isSuccess) {
      return todos.map((todo: any) => {
        return (
          <>
            <TextInput value={newTodo} onChangeText={setNewTodo} />
            <TouchableOpacity onPress={addNewTodo} />
            <TouchableOpacity key={todo.id} onPress={handleUpdateTodo(todo)}>
              <Text>{todo.title}</Text>
            </TouchableOpacity>
            <TouchableOpacity onPress={handleDeleteTodo(todo.id)} />
          </>
        );
      });
    }
  }, [isLoading, isError, isSuccess, error, todos, newTodo]);

  return <View>{content}</View>;
};
export default TodosListExample;
