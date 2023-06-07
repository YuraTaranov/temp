---
to: src/reducers/<%=h.changeCase.camelCase(name)%>.ts
---
import {createSlice} from '@reduxjs/toolkit';
import {EDataLoadingStatus, TGlobalState} from '@types';

type TInitialState = TGlobalState['<%=h.changeCase.camelCase(name)%>'];

const initialState: TInitialState = {
  data: [],
  status: EDataLoadingStatus.IDLE,
  error: null,
};

const <%=h.changeCase.camelCase(name)%>Slice = createSlice({
  name: '@@<%=h.changeCase.camelCase(name)%>',
  initialState,
  reducers: {
	set<%=h.changeCase.pascal(name)%>: (state, action) => {
      state.data = action.payload;
	},
	reset<%=h.changeCase.pascal(name)%>: () => initialState,
  },
});

// actions
export const {set<%=h.changeCase.pascal(name)%>, reset<%=h.changeCase.pascal(name)%>} = <%=h.changeCase.camelCase(name)%>Slice.actions;

// reducer
export const <%=h.changeCase.camelCase(name)%> = <%=h.changeCase.camelCase(name)%>Slice.reducer;

// selectors
export const select<%=h.changeCase.pascal(name)%> = (state: TGlobalState) => state.<%=h.changeCase.camelCase(name)%>;
