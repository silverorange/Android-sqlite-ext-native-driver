/* !---- DO NOT EDIT: This file autogenerated by com/jogamp/gluegen/JavaEmitter.java on Tue Sep 07 21:43:08 ADT 2021 ----! */


package io.liteglue;

import java.nio.*;

import com.jogamp.gluegen.runtime.*;
import com.jogamp.common.os.*;
import com.jogamp.common.nio.*;


class SQLiteResponse32 extends SQLiteResponse {

  public static int size() {
    return 8;
  }

  SQLiteResponse32(java.nio.ByteBuffer buf) {
    super(buf);
  }


  public SQLiteResponse setResult(int val) {
    accessor.setIntAt(0, val);
    return this;
  }

  public int getResult() {
    return accessor.getIntAt(0);
  }

  public SQLiteResponse setHandle(long val) {
    accessor.setIntAt(1, (int) val);
    return this;
  }

  public long getHandle() {
    return (long) accessor.getIntAt(1);
  }
}