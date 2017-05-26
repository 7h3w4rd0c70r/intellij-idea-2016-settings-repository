
package core;

import react.ReactComponent;

class Component<TProps: Props, TState: State> extends ReactComponentOfPropsAndState<TProps, TState> {
    function new(props: TProps) {
        super();
        state = defaultState();
    }

    function defaultState(): TState {
        return null;
    }
}

typedef Props = {
    @:optional var className: String;
}

typedef State = { }
