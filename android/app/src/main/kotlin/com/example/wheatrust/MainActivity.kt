package com.example.wheatrust
import android.Manifest.permission.READ_EXTERNAL_STORAGE
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.DocumentsContract
import android.provider.MediaStore.Images
import android.widget.Toast
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    var GO_TO_GALLERY =4
    val PICK_IMAGE = 1
    private val channel ="service"
    var paths = mutableListOf<String>()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            if(call.method == "Gallery")
            {
                paths.clear()
                if(Build.VERSION.SDK_INT<=22){
                    pickimage()
                }
                else{
                    requestPermissionForGallary()
                }
            }
            else if(call.method=="getImages"){
                result.success(paths)

            }
            else if(call.method=="resetPaths"){
                paths.clear()
            }
        }
    }

    @SuppressLint("NewApi")
    private fun pickimage() {
        val intent = Intent(Intent.ACTION_PICK, Images.Media.EXTERNAL_CONTENT_URI)
        intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
        intent.action = Intent.ACTION_GET_CONTENT
        intent.type = "image/*"
        startActivityForResult(Intent.createChooser(intent, "Choose Pictures"), PICK_IMAGE)

    }
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when (requestCode) {
            GO_TO_GALLERY -> {
                if ((grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED)) {
                    pickimage()

                } else {
                    Toast.makeText(this, "Permission Denied", Toast.LENGTH_SHORT).show()
                }
                return
            }
        }
    }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK && requestCode == PICK_IMAGE){

            if (data?.getClipData() != null) {
                var count = data.clipData!!.itemCount

                for (i in 0..count - 1) {
                    var imageUri: Uri = data.clipData!!.getItemAt(i).uri
                    paths.add(getDocumentIs(imageUri)!!)
                }
            }
            else if (data?.getData() != null) {
                var imageUri: Uri = data.data!!
                paths.add(getDocumentIs(imageUri)!!)
            }
        }
    }
    private fun requestPermissionForGallary() {
        ActivityCompat.requestPermissions(this, arrayOf(READ_EXTERNAL_STORAGE), GO_TO_GALLERY)
    }
    fun getDocumentIs(imageUri:Uri): String? {
        val wholeID = DocumentsContract.getDocumentId(imageUri)
        val id = wholeID.split(":".toRegex()).toTypedArray()[1]
        val column = arrayOf(Images.Media.DATA)
        val sel = Images.Media._ID + "=?"
        val cursor = contentResolver.query(Images.Media.EXTERNAL_CONTENT_URI, column, sel, arrayOf(id), null)
        var filePath: String? = ""
        val columnIndex = cursor!!.getColumnIndex(column[0])

        if (cursor!!.moveToFirst()) {
            filePath = cursor!!.getString(columnIndex)
        }
        cursor.close()
        return filePath
    }
}