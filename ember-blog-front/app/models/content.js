import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr(),
  published_date: DS.attr(),
  author: DS.attr(),
  summary: DS.attr(),
  content: DS.attr()

});
