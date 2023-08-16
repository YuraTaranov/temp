---
to: src/services/notifications/notifications.ts
unless_exists: true
---
import messaging, {FirebaseMessagingTypes} from '@react-native-firebase/messaging';
import {store} from '../../store'
import {notificationsHandler} from './notificationsHandler';

type TNotificationService = {
  init: () => Promise<void>;
  checkPermission: () => Promise<boolean>;
  requestPermission: () => Promise<void>;
};

export const notificationService: TNotificationService = {
  init: async () => {
    const checkResult: boolean = await notificationService.checkPermission();

    if (checkResult) {
      const fcmToken: string = await messaging().getToken();
      __DEV__ && console.log('---> fcmToken', fcmToken);

      try {
        // TODO: send token to server
		// const response = await store.dispatch(apiSlice.endpoints.sendToken.initiate({fcmToken}))      
	  } catch (error) {
        __DEV__ && console.log('--- send fcm token error', error);
      }

      if (!messaging().isDeviceRegisteredForRemoteMessages) {
        await messaging().registerDeviceForRemoteMessages();
      }
      messaging().setAutoInitEnabled(true);

      messaging().onMessage(async (remoteMessage: FirebaseMessagingTypes.RemoteMessage) => {
        __DEV__ && console.log('--- FOREGROUND', remoteMessage);
        notificationsHandler(remoteMessage);
      });

      messaging().onNotificationOpenedApp(async (remoteMessage: FirebaseMessagingTypes.RemoteMessage) => {
        __DEV__ && console.log('--- BACKGROUND', remoteMessage);
        notificationsHandler(remoteMessage);
      });

      messaging()
        .getInitialNotification()
        .then((remoteMessage: FirebaseMessagingTypes.RemoteMessage | null) => {
          __DEV__ && console.log('--- QUIT', remoteMessage);
          notificationsHandler(remoteMessage);
        });
    } else {
      notificationService.requestPermission();
    }
  },
  checkPermission: async () => {
    const permissionValue: FirebaseMessagingTypes.AuthorizationStatus = await messaging().hasPermission();
    return permissionValue > 0;
  },
  requestPermission: async () => {
    const requestResult: FirebaseMessagingTypes.AuthorizationStatus = await messaging().requestPermission();
    if (requestResult > 0) {
      notificationService.init();
    }
  },
};
