setImmediate(function () {

    Java.perform(function () {
        Java.use('c.k.a.j.t4').fxShieldPopup.overload().implementation = function (a) {

            Java.perform(function () {
                console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))
            });

            var context = getContext();
            var intent = Java.use("android.content.Intent").$new(
                context,
                Java.use('com.innov.lottecoupon.activity.main.MainActivity').class
            );

            intent.addFlags(intent.FLAG_ACTIVITY_NEW_TASK.value | intent.FLAG_ACTIVITY_CLEAR_TOP.value | intent.FLAG_ACTIVITY_SINGLE_TOP.value);
            context.startActivity(intent);
        }
    });

    Java.perform(function () {
        Java.use('com.softsecurity.transkey.TransKeyCtrl').a.overload('java.lang.String', '[B').implementation = function (a,b) {
            return "A"
        }
    });

    Java.perform(function () {
        Java.use('com.truefriend.mainlib.view.MainView').Scanrisk.overload('int', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'java.lang.String').implementation = function (a, b, c, d, e) {
            
            return 
        }
    });

    Java.perform(function () {
        Java.use('com.truefriend.mainlib.SmartBaseActivity').terminateApp.overload().implementation = function () {
            Java.perform(function () {
                console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))
            });
            
            return
        }
    });
    

    Interceptor.attach(Module.findExportByName("libc.so", "open"), {
        onEnter: function (args) {
            var target = Memory.readCString(args[0]);
            //console.log(target)
            if(target.includes("maps") || target.includes("net")){
                Memory.writeUtf8String(args[0], "/data/local/tmp/test")
                console.log(target)
            }
        },
        onLeave: function (retval) {

        }
    });
    
    // 두 개의 return 값 중 하나 선택, 내부 코드에 따라 달라짐
    Java.perform(function () {
        Java.use('android.provider.Settings$Secure').getString.overload('android.content.ContentResolver', 'java.lang.String').implementation = function (a, b) {
            if (b == "android_id") {
                console.log("\n[+] android.provider.Settings$Secure.getString('android.content.ContentResolver', 'java.lang.String')")
                console.log('[-] Parameters : ' + a + ", " + b)
                console.log('[-] Return Value : "A"')

                return "A"
                //return null
            }

            return this.getString.overload('android.content.ContentResolver', 'java.lang.String').call(this, a, b)
        }
    });

    Java.perform(function () {
        Java.use('java.lang.String').contains.overload('java.lang.CharSequence').implementation = function (a) {

            if (a == "test-keys") {
                console.log("\n[+] java.lang.String.contains('java.lang.CharSequence')")
                console.log('[-] Parameters : ' + a)
                console.log('[-] Return Value : False')

                return false
            }

            return this.contains.overload('java.lang.CharSequence').call(this, a)
        }
    });

    Java.perform(function () {
        Java.use('java.lang.String').equals.overload('java.lang.Object').implementation = function (a) {
            if (this == "sdk" || this == "google_sdk") {
                console.log("\n[+] java.lang.String.equals('java.lang.Object')")
                console.log('[-] Parameters : ' + a)
                console.log('[-] Return Value : False')

                return false
            }


            return this.equals.overload('java.lang.Object').call(this, a)
        }
    });

    Java.perform(function () {
        Java.use("java.io.File").exists.overload().implementation = function () {
            var detect = ["/sbin/su", "/sbin/su", "/system/su", "/system/bin/su", "/system/sbin/su",
                "/system/xbin/su", "/system/xbin/damonsu", "/system/xbin/mu", "/system/xbin/busybox",
                "/system/bin/.ext/.su", "/system/usr/su-backup", "/system/app/Superuser.apk", "/system/app/su.apk",
                "/system/etc/init.d/99SuperSUDaemon", "/system/bin/.ext", "/system/chattr", "/data/local/bin/su",
                "/data/local/xbin/su", "/system/bin/failsafe/su", "/data/data/com.noshufou.android.su",
                "/data/app/com.noshufou.android.su", "/data/app/eu.chainfire.supersu", "/data/local/xbin/su",
                "/data/local/xbin/su", "/data/local/su", "/su/bin/su"]

            var name = Java.use("java.io.File").getAbsolutePath.call(this)

            if (detect.includes(name)) {
                console.log("\n[+] java.io.File.exists()")
                console.log('[-] Value : ' + name)
                console.log('[-] Return Value : False')

                return false
            }

            return this.exists.overload().call(this);

        }
    })

    Java.perform(function () {

        Java.use("java.lang.Runtime").exec.overload('java.lang.String').implementation = function (a) {
            var detect = 'su'

            if (detect == a) {
                console.log("\n[+] java.lang.Runtime.exec('java.lang.String)")
                console.log('[-] Values : ' + a)
                console.log('[-] Return Value : Throw Except')

                var temp = Java.use('java.lang.InterruptedException').$new()
                var except = Java.use('java.lang.Exception').$new(temp);
                throw except
            }
            return this.exec.overload('java.lang.String').call(this, a);
        }
    })

    Java.perform(function () {
        Java.use("java.lang.Runtime").exec.overload('[Ljava.lang.String;').implementation = function (a) {
            var detect0 = '/system/xbin/which'
            var detect1 = 'su'

            if (a[0] == detect0 || a[1] == detect1 || a[0] == detect[1] || a[1] == detect0) {
                console.log("\n[+] java.lang.Runtime.exec('[Ljava.lang.String;)")
                console.log('[-] Values : ' + a[0] + ", " + a[1])
                console.log('[-] Return Value : Throw Except')

                var except = Java.use('java.lang.Exception').$new();
                throw except
            }

            return this.exec.overload('[Ljava.lang.String;').call(this, a);

        }
    })

    Java.perform(function () {

        Java.use('android.app.ApplicationPackageManager').getInstallerPackageName.overload('java.lang.String').implementation = function (a) {
            var context = getContext()
            var packageName = context.getPackageName()

            if (a == packageName) {
                console.log("\n[+] android.app.ApplicationPackageManager.getInstallerPackageName('java.lang.String')")
                console.log('[-] Values : ' + a)
                console.log('[-] Return Value : com.android.vending')

                return "com.android.vending"
            }
            return this.getInstallerPackageName.overload('java.lang.String').call(this, a);
        }
    })


})

function getContext() {
    try {
        const ActivityThread = Java.use('android.app.ActivityThread');
        const application = ActivityThread.currentApplication();
        return application.getApplicationContext();
    }
    catch (e) {
        console.log(e);
    }
}