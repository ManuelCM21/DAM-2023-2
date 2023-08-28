package pe.edu.upeu.appdemo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.EditText

class MainActivity : AppCompatActivity() {
    private lateinit var valorResultado: EditText
    private var operadorActual = ""
    private var numeroActual = 0.0
    private var numeroAnterior = 0.0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        valorResultado = findViewById(R.id.txtResult)
        setupButtons()
    }

    private fun setupButtons() {
        val buttons = arrayOf(
            R.id.btn0, R.id.btn1, R.id.btn2, R.id.btn3,
            R.id.btn4, R.id.btn5, R.id.btn6, R.id.btn7,
            R.id.btn8, R.id.btn9, R.id.btnPunto, R.id.btnIgual,
            R.id.btnSum, R.id.btnRest, R.id.btnMul, R.id.btnDiv, R.id.btnPoten,
            R.id.btnRaiz, R.id.btnFrac, R.id.btnPi,
            R.id.btnBorrar
        )
        for (buttonId in buttons) {
            val button = findViewById<Button>(buttonId)
            button.setOnClickListener { onButtonClick(button) }
        }
    }

    private fun appendToInput(value: String) {
        valorResultado.append(value)
    }

    private fun onButtonClick(view: View) {
        when (view.id) {
            R.id.btn0, R.id.btn1, R.id.btn2, R.id.btn3,
            R.id.btn4, R.id.btn5, R.id.btn6, R.id.btn7,
            R.id.btn8, R.id.btn9, R.id.btnPunto -> {
                val button = findViewById<Button>(view.id)
                appendToInput(button.text.toString())
            }
            R.id.btnSum, R.id.btnRest, R.id.btnMul, R.id.btnDiv, R.id.btnPoten, R.id.btnRaiz, R.id.btnFrac, R.id.btnPi, -> {
                val button = findViewById<Button>(view.id)
                setOperator(button.text.toString())
            }
            R.id.btnIgual -> calculateResult()
            R.id.btnBorrar-> {
                valorResultado.setText("0")
                operadorActual=""
                numeroActual=0.0
                numeroAnterior=0.0
            }
        }
    }

    private fun setOperator(operator: String) {
        operadorActual = operator
        numeroAnterior = valorResultado.text.toString().toDouble()
        valorResultado.setText("0")
    }

    private fun calculateResult() {
        numeroActual = valorResultado.text.toString().toDouble()
        val result = when (operadorActual) {
            "+" -> numeroAnterior + numeroActual
            "-" -> numeroAnterior - numeroActual
            "*" -> numeroAnterior * numeroActual
            "/" -> numeroAnterior / numeroActual
            "^" -> Math.pow(numeroAnterior, numeroActual)
            "√" -> Math.sqrt(numeroAnterior)
            "1/x" ->  1/numeroAnterior
            "π" -> Math.PI
            else -> numeroActual
        }
        valorResultado.setText(result.toString())
        operadorActual = ""
    }
}