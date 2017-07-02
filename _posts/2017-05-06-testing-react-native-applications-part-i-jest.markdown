---
layout: post
title: "Testing React Native Applications Part I: Jest"
author:
    name: Preslav Rachev
---

When I started with React Native not long ago I was frustrated by the overwhelming amount of irrelevant information on how to test React applications. React is known to evolve fast, often introducing breaking changes, so this should not be surprising to most developers. Still, the amount of deprecated content out there leaves a sort of a bad feeling, especially among developers who have just started working with React or RN. 

Having spent a few days, breaking walls down on my own, I decided to document the current state of testing affairs, with the hope that my post won't become obsolete by the time it comes out. 

**Note:** Though I initially wanted to write a big post describing RN testing in detail, I decided to split it up into manageable chunks. This post will talk about Jest, what it is, and why it is useful.

## Jest
When you create a new React or React Native application via one of the provided CLI tools, it automatically creates a sample unit test using a framework called [Jest](https://facebook.github.io/jest/). I have to say upfront. You don't necessarily have to use Jest for your RN tests, but it definitely brings a few interesting features to the table. 

Similar to Mocha, Jest is an opininionated test runner and assertion framework, which uses the familiar BDD syntax of describing and asserting tests:

```javascript
describe('calculator', function() {
  describe('add()', function() {
    it('should add 2 numbers togoether', function() {
      expect(calculator.add(2, 2)).toEqual(4);
    });
  });
});
```

### Setting up
Setting Jest up and writing your first test is fairly easy, due to its 'convention-over-configuration' approach. Though fine-tuning the Jest config is totally possible, there are predefined defaults for everything. In fact, all you need to do is place your tests under `__tests__`, and mock modules under `__mocks__` and Jest will find them automatically. 

### Mocking

On top of that though, Jest provides a few interesting features on its own. One is its aggressive approach to mocking. Up to a few versions, ago, Jest's `automock` option was set to `true` by default. This meant that unless it were explicitly configured not to do so, Jest would create a mock out of every library and dependancy relevant to your code. The development team [realized](https://facebook.github.io/jest/blog/2016/09/01/jest-15.html) though that this is one idea too aggressive, and though the option is still there, it is set to `false` by default:

> We introduced automocking at Facebook and it worked great for us when unit testing was adopted in a large existing code base with few existing tests, but over time it felt like people spent more time fighting with mocked/unmocked modules than it would have taken them to write a test normally. We also noticed that library authors often require a huge number of basic modules that always have to be manually unmocked.

Still, with automocking turned off, you could pretty easily mock entire modules, or just a few functions whose calls are expensive or unnecessary (HTTP requests, disk read/writes etc).

#### Jest Mocking Cheatsheet

```javascript
// Mock-related functions available via the global Jest object
jest.resetAllMocks()
jest.clearAllTimers()
jest.disableAutomock()
jest.enableAutomock()
jest.fn(?implementation)
jest.isMockFunction(fn)
jest.genMockFromModule(moduleName)
jest.mock(moduleName, ?factory, ?options)
jest.resetModules()
jest.setMock(moduleName, moduleExports)
jest.unmock(moduleName)
jest.spyOn()

// Mock functions available to every mock
mockFn.mock.calls
mockFn.mock.instances
mockFn.mockClear()
mockFn.mockReset()
mockFn.mockRestore()
mockFn.mockImplementation(fn)
mockFn.mockImplementationOnce(fn)
mockFn.mockReturnThis()
mockFn.mockReturnValue(value)
mockFn.mockReturnValueOnce(value)
```

### Snapshotting
Besides mocking, snapshotting is the other big feature that Jest provides. If you are using the React or React Native CLI, you must have already seen this line of code in your tests:

```javascript
expect(tree).toMatchSnapshot();
```

When asserting against a snapshot, Jest will look for an existing one in the `__snapshots__` directory, and if none were found, will save the current one there. The next time the test gets run, the current one gets compared to the existing one, and if there is a change, the test will break.

Snapshotting comes super useful when testing the integration of multiple components, where the result is usually a heavily neseted structure. The way developers write such tests is either using many assertions, writing portions of the expected output by hand, or use a few, but very shallow assertions (like `toContain`). Snapshotting, therefore, helps save a lot of time writing all this tedious assertion code by hand.

This example out of the [official Jest blog](https://facebook.github.io/jest/blog/2016/07/27/jest-14.html) uses the rendered output of a React component to illustrate snapshotting: 

```javascript
import renderer from 'react-test-renderer';

test('Link renders correctly', () => {
  const tree = renderer.create(
    <Link page="http://www.facebook.com">Facebook</Link>
  ).toJSON();
  expect(tree).toMatchSnapshot();
});
```

and the corresponding snapshot that gets saved:

```javascript
exports['Link renders correctly 1'] = '
<a
  className="normal"
  href="http://www.facebook.com"
  onMouseEnter={[Function bound _onMouseEnter]}
  onMouseLeave={[Function bound _onMouseLeave]}>
  Facebook
</a>
';
```

Though you will certainly find snapshotting useful for verifying the rendered output of your apps and components, these are by far not the only uses cases. I find it very helpful when verifying global application state, e.g. using libraries like Redux or other similar approaches. 


## Conclusion
All in all, I find Jest's 'zero-conf, batteries-included' approach to testing pretty fun to work with. Starting a new project, especially a React or React Native one, it makes sense to go with it, since it comes bundled in. Even if you are already having a large codebase of tests, assuming they follow the familiar BDD conventions (and most probably using Jasmine assertions), you can get it up and running on Jest in pretty much no time. Beware that the documentation is not always up-to-date, so you might have to invest some further time checking Medium and GitHub.

Now that I've cleared it up a bit what Jest is all about, I will focus on structurally testing React Native applications in my next post.

## Further Reading

- [The official Jest website](https://facebook.github.io/jest/)
- [Jasmine vs. Mocha, Chai, and Sinon](http://thejsguy.com/2015/01/12/jasmine-vs-mocha-chai-and-sinon.html)
- [Testing React Applications with Karma, Jest or Mocha](http://instea.sk/2016/08/testing-react-applications-with-karma-jest-or-mocha/)  
- [Jest CheatSheet](https://dmitriiabramov.github.io/jest-cheatsheet/index.html)
- [Testing React Native Apps · Jest](https://facebook.github.io/jest/docs/tutorial-react-native.html)
- [De-mystifying Jest Snapshot Test Mocks](https://medium.com/xebia/de-mystifying-jest-snapshot-test-mocks-8e7183d109ea)