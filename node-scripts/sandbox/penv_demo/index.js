//console.log(process.env.SOMEPROP || "undefined")

process.env.SOMEPROP = "A"

// export this to test state mgmt w external use
const someobj = {
	// state
	prevSomeprop: process.env.SOMEPROP || null,
	declarations: 0,
	// methods
	getSomeprop() {
		return process.env.SOMEPROP
	},
	setSomeprop(arg) {
		this.declarations += 1

		this.prevSomeprop = process.env.SOMEPROP
		
		process.env.SOMEPROP = arg
	},
	stats() {
		console.log(`Previous Value = ${this.prevSomeprop}`)
		console.log(`Current Value = ${process.env.SOMEPROP}`)
		console.log(`Times Value Has Been Set = ${this.declarations}`)
	}
}

someobj.setSomeprop("B")
someobj.setSomeprop("C")
someobj.setSomeprop("BASDASD")
someobj.stats()

// call external method that sets process.env.SOMEPROP

