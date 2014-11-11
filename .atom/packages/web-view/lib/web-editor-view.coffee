_ = require 'underscore-plus'
{$, ScrollView} = require 'atom'

# View that renders the image of an {WebEditor}.
module.exports =
class WebEditorView extends ScrollView

  @content: ->
    @div class: 'web-view-area', =>
      @div class: 'web-view-toolbar', =>
        @button outlet: 'reladPage', class: 'icon icon-sync', 'Reload',
      @iframe id: 'web-view-iframe', name: 'disable-x-frame-options', tabindex: -1, src: ""

  constructor: (uri) ->
    super

    @.find('#web-view-iframe').attr('src', uri)

  initialize: (@pack, @packageManager) ->
    @handleButtonEvents()

  handleButtonEvents: ->
    @reladPage.on 'click', =>
      @reloadIframe()
      false

  reloadIframe: () ->
    @.find('#web-view-iframe')[0].contentWindow.location.reload();

  @deserialize: ({uri}) ->

  # Gets the title of the page based on the uri
  #
  # Returns a {String}
  getTitle: ->
    @uri || 'Uri-web'

  # Serializes this view
  #
  serialize: ->
    {@uri, deserializer: @constructor.name}

  # Retrieves this view's pane.
  #
  # Returns a {Pane}.
  getPane: ->
    @parents('.pane').view()
