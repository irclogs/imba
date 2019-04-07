
export def getChannelList
    var url = window.URL.new "https://irc.softver.org.mk/ddoc/_view/channel"
    var params = {
        update_seq: true,
        reduce: true,
        group_level: 1
    }
    url:search = window.URLSearchParams.new params
    var res = await window.fetch url
    var data = await res.json
    var channelList = data['rows'].map do |item| {name: item['key'][0], weight: item['value']}
    return window.Promise.resolve(channelList)


export def getLast100
    var url = window.URL.new "https://irc.softver.org.mk/ddoc/_view/channel"
    var start_key = window.JSON.stringify ["lugola",{}]
    var end_key = window.JSON.stringify ["lugola",0]
    var params = {
        start_key: start_key,
        end_key: end_key,
        descending: true,
        limit: 100,
        include_docs: true,
        update_seq: true,
        reduce: false
    }
    url:search = window.URLSearchParams.new params
    var res = await window.fetch url
    var data = await res.json
    var last100 = data['rows'].map do |item| item['doc']
    return window.Promise.resolve(last100.reverse)
