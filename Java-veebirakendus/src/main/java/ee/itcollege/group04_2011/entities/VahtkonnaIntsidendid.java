package ee.itcollege.group04_2011.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class VahtkonnaIntsidendid {
	private Vahtkond vahtkond;
	private Collection<Intsident> intsidendid;
	
	public Vahtkond getVahtkond() {
		return vahtkond;
	}
	public void setVahtkond(Vahtkond vahtkond) {
		this.vahtkond = vahtkond;
	}
	public Collection<Intsident> getIntsidendid() {
		return intsidendid;
	}
	public void setIntsidendid(List<Intsident> intsidendid) {
		this.intsidendid = intsidendid;
	}
	
	public static Collection<VahtkonnaIntsidendid> annaVahtkondadekaupaIntsidendid() {
		Collection<VahtkonnaIntsidendid> vahtkonnaIntsidendid = new ArrayList<VahtkonnaIntsidendid>();
		List<Vahtkond> vahtkonnad = Vahtkond.findAllVahtkonds();
		for(Iterator<Vahtkond> i = vahtkonnad.iterator(); i.hasNext(); ) {
			Vahtkond vahtkond = i.next();
			Collection<Intsident> intsidendid = VahtkonnaIntsidendid.annaVahtkonnaIntsidendid(vahtkond, Intsident.findAllIntsidents());
			VahtkonnaIntsidendid vahtkonnaIntsident = new VahtkonnaIntsidendid();
			vahtkonnaIntsident.vahtkond  = vahtkond;
			vahtkonnaIntsident.intsidendid = intsidendid;
			vahtkonnaIntsidendid.add(vahtkonnaIntsident);
		}
		return vahtkonnaIntsidendid;
	}
	
	public static Collection<Intsident> annaVahtkonnaIntsidendid(Vahtkond vahtkond, List<Intsident> intsidendid) {
		return Intsident.findAllVahtkonnaIntsidendid(vahtkond);
	}
}
