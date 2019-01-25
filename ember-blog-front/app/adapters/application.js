import DS from 'ember-data';

export default DS.JSONAPIAdapter.extend({
  host: 'http://localhost:3000',

  buildURL(modelName, id, snapshot, requestType, query) {
    let url = this._super(modelName, id, snapshot, requestType, query);
    return url + ".json";
  },
});
