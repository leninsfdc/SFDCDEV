import { LightningElement } from 'lwc';

import id from '@salesforce/user/Id';

export default class LWCCurrentUSERId extends LightningElement {

    userId = id;

}