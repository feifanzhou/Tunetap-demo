jest.dontMock '../../components/fan.js.coffee'
describe 'FanRoot', ->
  beforeEach ->
    React = require('react/addons')
    @TestUtils = React.addons.TestUtils
    Util = require '../../_utils.js.coffee'
    FanComps = require '../../components/fan.js.coffee'
    FanRoot = FanComps.FanRoot

    @_selectedShouldEqual = (target) ->
      selected = @TestUtils.findRenderedDOMComponentWithClass(@fanRoot, 'Selected')
      selectedText = selected.getDOMNode().getElementsByTagName('p')[0].textContent
      expect(selectedText).toEqual(target)

    # Render fanroot into document
    @fanRoot = FanRoot()
    @TestUtils.renderIntoDocument(@fanRoot)
  it 'should have all five nav sections', ->
    navSections = @TestUtils.scryRenderedDOMComponentsWithClass(@fanRoot, 'NavigatorSection')
    expect(navSections.length).toEqual(5)
    searchSection = navSections[0]
    searchField = searchSection.getDOMNode().getElementsByTagName('input')[0]
    expect(searchField.getAttribute('placeholder')).toEqual('Find events and artists')
    navSections.splice(0, 1)
    navTexts = navSections.map (sec) -> 
      par = sec.getDOMNode().getElementsByTagName('p')[0]
      return par.textContent
    expect(navTexts).toEqual(['Events on tap', 'Confirmed events', 'Featured artists', 'Friends'])
  it 'should have "Events on tap" selected (exclusively)', ->
    @_selectedShouldEqual('Events on tap')
  it 'should switch selection when navigating', ->
    navSections = @TestUtils.scryRenderedDOMComponentsWithClass(@fanRoot, 'NavigatorSection')
    search = navSections[0]
    @TestUtils.Simulate.click(search)
    selected = @TestUtils.findRenderedDOMComponentWithClass(@fanRoot, 'Selected')
    searchField = selected.getDOMNode().getElementsByTagName('input')[0]
    expect(searchField.getAttribute('placeholder')).toEqual('Find events and artists')
    ontap = navSections[1]
    @TestUtils.Simulate.click(ontap)
    @_selectedShouldEqual('Events on tap')
    conf = navSections[2]
    @TestUtils.Simulate.click(conf)
    @_selectedShouldEqual('Confirmed events')
    feat = navSections[3]
    @TestUtils.Simulate.click(feat)
    @_selectedShouldEqual('Featured artists')
  it 'should change content when navigating', ->
    navSections = @TestUtils.scryRenderedDOMComponentsWithClass(@fanRoot, 'NavigatorSection')
    search = navSections[0]
    @TestUtils.Simulate.click(search)
    res = @TestUtils.findRenderedDOMComponentWithClass(@fanRoot, 'SearchResults')
    expect(res.getDOMNode().textContent).toContain('currently not available')
    ontap = navSections[1]
    @TestUtils.Simulate.click(ontap)
    eventNames = @TestUtils.scryRenderedDOMComponentsWithClass(@fanRoot, 'DemoCardName')
    expect(eventNames.length).toEqual(2)
    expect(eventNames[0].getDOMNode().textContent).toEqual('Graduation recital')
    conf = navSections[2]
    @TestUtils.Simulate.click(conf)
    eventNames = @TestUtils.scryRenderedDOMComponentsWithClass(@fanRoot, 'DemoCardName')
    expect(eventNames.length).toEqual(1)
    expect(eventNames[0].getDOMNode().textContent).toEqual('East by Northeast')
    feat = navSections[3]
    @TestUtils.Simulate.click(feat)
    artists = @TestUtils.scryRenderedDOMComponentsWithClass(@fanRoot, 'DemoCardName')
    expect(artists.length).toEqual(4)
    expect(artists[0].getDOMNode().textContent).toEqual('Dylan Owen')