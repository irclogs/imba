import {getChannelList, getLast100} from './couch';

var State = {channelList: [], channelMessages: []}

tag App

  def mount
    getChannelList().then do |data|
      State:channelList = data
      Imba.commit

    getLast100().then do |data|
      State:channelMessages = data
      Imba.commit

  def render
    <self>
      # <ul> for item in State:channelList
      #   <li title="{item:weight}"> item:name
      <ul> for item in State:channelMessages
        <li title="{item:timestamp}"> "{item:sender} -> {item:message}"


Imba.mount <App>
