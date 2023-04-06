---
to: src/services/notifications/notificationsHandler.ts
unless_exists: true
---
// need to refactor
import {Platform} from 'react-native';
import PushNotification from 'react-native-push-notification';
import PushNotificationIOS from '@react-native-community/push-notification-ios';
import {FirebaseMessagingTypes} from '@react-native-firebase/messaging';
import {setNotifications} from '@reducers/notifications';
import {navigate} from '@services';
import {TNotification} from '@types';
import {store} from '../../store';

type TRemoteMessage = FirebaseMessagingTypes.RemoteMessage | null;

// const notifications: TNotification[] = store?.getState().notifications;
// const dispatchNotifications = (notifications: TNotification[]) => store?.dispatch(setNotifications(notifications));

export const notificationsHandler = async (remoteMessage: TRemoteMessage) => {
  if (remoteMessage.data) {
    // --- clear notification center from notifications
    // PushNotification.removeAllDeliveredNotifications();
    // if (Platform.OS === 'ios') {
    //   PushNotificationIOS.removeAllDeliveredNotifications();
    //   PushNotificationIOS.setApplicationIconBadgeNumber(0);
    // }
    // --- set badge counter to app icon
    // if (remoteMessage.data && remoteMessage.data.badge) {
    //   if (Platform.OS === 'ios') {
    //     PushNotificationIOS.setApplicationIconBadgeNumber(Number(remoteMessage.data.badge));
    //   }
    // }
    // --- uniq check
    // const exist = notifications.some(n => n.id === remoteMessage?.data?.id);
    // if (!exist) {
    //   dispatchNotifications([remoteMessage?.data, ...notifications]);
    // }
    // --- dispatch to redux all notifications from the notification center (if they have accumulated)
    // PushNotification.getDeliveredNotifications(data => {
    //   if (data.length) {
    //     const formattedNotifications = data.map(item => {
    //       // convert data
    //       return {};
    //     });
    //     dispatchNotifications([...formattedNotifications, ...notifications]);
    //   }
    // });
  } else {
    __DEV__ && console.log('--- notification data is empty');
  }
};

