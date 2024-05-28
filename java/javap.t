Setup
  $ cp -r ${TESTDIR}/resources resources
  $ source "/root/.sdkman/bin/sdkman-init.sh"

Compiling a java source file produces a bytecode representation in a .class file
  $ javac resources/Pinguin.java
  $ ls resources
  Pinguin.class
  Pinguin.java
javap allows to inspect this bytecode representation
A simple usage is to show a synthetic view of the class public components and APIs
  $ javap resources/Pinguin.class
  Compiled from "Pinguin.java"
  public class Pinguin {
    public final java.lang.String publicName;
    public Pinguin(java.lang.String);
    public java.lang.String cuteSound();
    public java.lang.String cuteMove();
  }

Use -p to also display private fields and methods
  $ javap -p resources/Pinguin.class
  Compiled from "Pinguin.java"
  public class Pinguin {
    public final java.lang.String publicName;
    private final java.lang.String privateName;
    public Pinguin(java.lang.String);
    public java.lang.String cuteSound();
    public java.lang.String cuteMove();
    private int cutenessLevel();
  }

Use -v to access the details of methods body and bytecode instructions
  $ javap -v resources/Pinguin.class | grep -v "Last modified\|checksum\|Classfile"
    Compiled from "Pinguin.java"
  public class Pinguin
    minor version: 0
    major version: 65
    flags: (0x0021) ACC_PUBLIC, ACC_SUPER
    this_class: #18                         // Pinguin
    super_class: #2                         // java/lang/Object
    interfaces: 0, fields: 2, methods: 4, attributes: 1
  Constant pool:
     #1 = Methodref          #2.#3          // java/lang/Object."<init>":()V
     #2 = Class              #4             // java/lang/Object
     #3 = NameAndType        #5:#6          // "<init>":()V
     #4 = Utf8               java/lang/Object
     #5 = Utf8               <init>
     #6 = Utf8               ()V
     #7 = String             #8             // _
     #8 = Utf8               _
     #9 = String             #10            //
    #10 = Utf8
    #11 = Methodref          #12.#13        // java/lang/String.replace:(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    #12 = Class              #14            // java/lang/String
    #13 = NameAndType        #15:#16        // replace:(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    #14 = Utf8               java/lang/String
    #15 = Utf8               replace
    #16 = Utf8               (Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    #17 = Fieldref           #18.#19        // Pinguin.publicName:Ljava/lang/String;
    #18 = Class              #20            // Pinguin
    #19 = NameAndType        #21:#22        // publicName:Ljava/lang/String;
    #20 = Utf8               Pinguin
    #21 = Utf8               publicName
    #22 = Utf8               Ljava/lang/String;
    #23 = Fieldref           #18.#24        // Pinguin.privateName:Ljava/lang/String;
    #24 = NameAndType        #25:#22        // privateName:Ljava/lang/String;
    #25 = Utf8               privateName
    #26 = String             #27            // Kwiiik :)
    #27 = Utf8               Kwiiik :)
    #28 = String             #29            // Sliding yay!
    #29 = Utf8               Sliding yay!
    #30 = Utf8               (Ljava/lang/String;)V
    #31 = Utf8               Code
    #32 = Utf8               LineNumberTable
    #33 = Utf8               cuteSound
    #34 = Utf8               ()Ljava/lang/String;
    #35 = Utf8               cuteMove
    #36 = Utf8               cutenessLevel
    #37 = Utf8               ()I
    #38 = Utf8               SourceFile
    #39 = Utf8               Pinguin.java
  {
    public final java.lang.String publicName;
      descriptor: Ljava/lang/String;
      flags: (0x0011) ACC_PUBLIC, ACC_FINAL
  
    public Pinguin(java.lang.String);
      descriptor: (Ljava/lang/String;)V
      flags: (0x0001) ACC_PUBLIC
      Code:
        stack=4, locals=2, args_size=2
           0: aload_0
           1: invokespecial #1                  // Method java/lang/Object."<init>":()V
           4: aload_0
           5: aload_1
           6: ldc           #7                  // String _
           8: ldc           #9                  // String
          10: invokevirtual #11                 // Method java/lang/String.replace:(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
          13: putfield      #17                 // Field publicName:Ljava/lang/String;
          16: aload_0
          17: aload_1
          18: putfield      #23                 // Field privateName:Ljava/lang/String;
          21: return
        LineNumberTable:
          line 5: 0
          line 6: 4
          line 7: 16
          line 8: 21
  
    public java.lang.String cuteSound();
      descriptor: ()Ljava/lang/String;
      flags: (0x0001) ACC_PUBLIC
      Code:
        stack=1, locals=1, args_size=1
           0: ldc           #26                 // String Kwiiik :)
           2: areturn
        LineNumberTable:
          line 11: 0
  
    public java.lang.String cuteMove();
      descriptor: ()Ljava/lang/String;
      flags: (0x0001) ACC_PUBLIC
      Code:
        stack=1, locals=1, args_size=1
           0: ldc           #28                 // String Sliding yay!
           2: areturn
        LineNumberTable:
          line 15: 0
  }
  SourceFile: "Pinguin.java"
