
import msignal.Signal;
import mmvc;
import mmvc.impl.Context;
import mmvc.api.IViewContainer;


class MainContext extends Context {
    public function new(?contextView: IViewContainer = null) {
        super(contextView);
    }

    override function startup(): Void {
        
    }
}
