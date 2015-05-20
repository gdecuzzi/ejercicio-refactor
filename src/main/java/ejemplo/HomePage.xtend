package ejemplo

import java.io.Serializable
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.model.PropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XAjaxLink
import org.uqbar.wicket.xtend.XLink

/**
 * 
 * @author ?
 */ 
class HomePage extends WebPage implements Serializable{
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	int contador

	new() {
		val label = new Label("version", application.frameworkSettings.version)
		
		this.addChild(label);

		contador = 0
		val cuenta = new Label("cuenta", new PropertyModel(this, "contador"))=>[outputMarkupId = true]
		addChild(new XAjaxLink("incrementar") => [onClick = [target | sumarUno(); target.add(cuenta)]])
		addChild(new XLink("decrementar") => [onClick = [| restarUno()]])
		addChild(cuenta)
		
    }
	
	// FIXME! ESTO ES LOGICA DE COMINIO ¿POR QUE EN LA VITA??????
	def restarUno() {
		contador = contador - 1
	}
	
	def sumarUno() {
		contador = contador + 1
	}
	
}
