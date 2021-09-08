/* !---- DO NOT EDIT: This file autogenerated by com/jogamp/gluegen/JavaEmitter.java on Tue Sep 07 21:43:08 ADT 2021 ----! */


package io.liteglue;

import java.nio.*;

import com.jogamp.gluegen.runtime.*;
import com.jogamp.common.os.*;
import com.jogamp.common.nio.*;


public abstract class SQLiteResponse {

  StructAccessor accessor;

  public static int size() {
    if (Platform.is32Bit()) {
      return SQLiteResponse32.size();
    } else {
      return SQLiteResponse64.size();
    }
  }

  public static SQLiteResponse create() {
    return create(Buffers.newDirectByteBuffer(size()));
  }

  public static SQLiteResponse create(java.nio.ByteBuffer buf) {
    if (Platform.is32Bit()) {
      return new SQLiteResponse32(buf);
    } else {
      return new SQLiteResponse64(buf);
    }
  }

  SQLiteResponse(java.nio.ByteBuffer buf) {
    accessor = new StructAccessor(buf);
  }

  public java.nio.ByteBuffer getBuffer() {
    return accessor.getBuffer();
  }

  public abstract SQLiteResponse setResult(int val);

  public abstract int getResult();

  public abstract SQLiteResponse setHandle(long val);

  public abstract long getHandle();
}
