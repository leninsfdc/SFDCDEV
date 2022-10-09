import { LightningElement, wire } from 'lwc';

import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import userId from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';
const fields = [NAME_FIELD];

export default class Selector extends LightningElement {

    user18id = userId;

    @wire(getRecord, { recordId: '$userId', fields })
    user;

    get name() {
        return getFieldValue(this.user.data, NAME_FIELD);
    }

}