import Navigator from 'native-navigation';
import { SCREENONE } from './routes';

Navigator.registerScreen(SCREENONE, () => require('./screens/ScreenOne'));
