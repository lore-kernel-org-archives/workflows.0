Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A147CC8E
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109175; cv=none; b=dwz8L3Y2lJBqFiT7wqe4gxobU/H0JzAXY5smos/dME9k8RihJMV3BlZrzGL5KgxH42H3rhQlqgpUEKtidAEFHtwTDG3Aisxf+fanWFdsMn0TvUilrynvDwuXJx8wfJ/ob7OjvNKB1RXXdS5rcntBQFcm3vouC+q9Iaass1PAnts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109175; c=relaxed/simple;
	bh=bXuunO1+TKZxIn/PbBTEBTzoGcc4NaXizcZznUNsj8k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAu83NNsRcI8BDby6wXGWDowmGxsNLjNIYXpQrxl2980LZbaKg5q1tEk+a9RvcDcbZR3y1seB+HW/fq2h454hoYR9PuAjLFcLXOaHWezOXzECIMsmWoyMU9aXhKUTQZqqXNZ4/+exao4eCaW0t1H0e4BqVFTl2dwxqFxef0psEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHQrpHek; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHQrpHek"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1279977f8f.3
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109169; x=1779713969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMHpOkWcOjtFb4OspGjWFo8LVP9NfvBDBGISty1lLiA=;
        b=mHQrpHek+RHTlsjnYSsjjKy0BTDY+qCVchnHTIMkCPEODmlfqWJOALFetXC3ARBv3I
         3fHsLSVI1WUuZYfJtbGo+wNe8pzZCIYqFCiovtp9qW6a9fTpGYZqNhmDxoEB5/VJhkm4
         TAagYG6yF+in4bQz22Q40wN7tq0NweE0doc/G7+T1yQ0rVYQvuaXvXsLCLDxvlOcSBBC
         Y+7a0ef+NovD60Ve7AcrQSwn+U1lNZVDxmHZih0hOsFeWCEpEVXAxSUlLVtjVHk3zCyd
         WyqU9+9JpGhYFX2vU/HagwGycFqBZYaOUooC4A0He/BBymvf7kcxd150mI4FA6jT3A0Z
         tnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109169; x=1779713969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TMHpOkWcOjtFb4OspGjWFo8LVP9NfvBDBGISty1lLiA=;
        b=rNal2B0BDN2tEYanZD18tSup6EBxl6Lnq9qS3TfWhvrVTl/dZU2ng3Lrhfr9zdP5Nd
         WNk7LqY+MIWbv12DUoP+9OT++8q/o3pdV9RUBOiNqFyPz8cK6LZlsG575jHBGdtuGw9E
         vZmsSkKx5t7aWxkf/aN6ZwWD5cSoUyK0BjHF9VIzcirTJ/BOF0AIwFhhk//QPatmiOU/
         bgA2PqQnMms+6ng87kakUxdfrXj6HDMtN9yTyNioc7kxBELqUGZb079Gsy9na6SmhL6t
         UJttlEXiSdm99YoQnyJl7DpKuGuvzGHoCJLAUHvLL9GZvCVrAbD/AkNzXT7l2Q65cxSX
         B/Dw==
X-Forwarded-Encrypted: i=1; AFNElJ8xDxvQtbSab6FjkI9BVgwffAu2JT1TjNu3waK7/Vb8wdt5d/fUSE5ekWILQVP2FwWhJTzZn1fNEPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1RTCnw0s5dsHwr+DZT6+YjuKE6gzp/iSvT1E448/DX0cczsZQ
	TntA3THcrsfKdcPAoHiT2dffVh+j5ekQHylV1R7aJiOREA4wmlU5EJpz
X-Gm-Gg: Acq92OFeHtPdpn/iaQy+4GF0vxVXEd0+OFpRGmzGsSXdX1VPareBOkUfANqxnVjvPBg
	Fr2vKZlG5o/CjeVhZRnAVuUSsGnunHECozmdL5367NrAqU6HkE4FV8yURlz6dPoXWfrimSOVIUZ
	p+uQfojnqSAMCmAZq/axK4J4V0hxhr25S2559yWXRu//llwiNMmr+ZHLQEkXHe8us8+pwpSQUTT
	dPMKsTVbzi1RHYbz42lNjJVNbU+NJuOgx1fxXUpTrcm+Ufm0Ruxs9eUCfVraB8capd0aDnGoGZd
	xCHza8DP47D9Lf47DEdS0R14fP38nu0srITAPGzqd4xT7s1Aa+eOZUa8qtLdQ+WJHeD+eMinpXo
	ZAvwvZiyWN/63QRMv2nB40SAD0eKmMU/cf6I/IANFNCKucVLqw13XF+Y23AnyHX3hXnl6U8us/2
	YsghgzLdQAvPoR3HZjjFNACFI+JkxYxT33q9VKwF7b2ilqyxZiObU289j7hSlzJRUF
X-Received: by 2002:a5d:5f42:0:b0:44a:fa76:5193 with SMTP id ffacd0b85a97d-45e5c5af4f8mr25341873f8f.12.1779109168494;
        Mon, 18 May 2026 05:59:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm35811638f8f.36.2026.05.18.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:59:28 -0700 (PDT)
Date: Mon, 18 May 2026 13:59:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Kees Cook <kees@kernel.org>, Manuel
 Ebner <manuelebner@mailbox.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
Message-ID: <20260518135926.0a916782@pumpkin>
In-Reply-To: <CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
	<20260514162652.107714-2-manuelebner@mailbox.org>
	<202605140931.913048A68B@keescook>
	<20260516152819.14597A76-hca@linux.ibm.com>
	<20260516173524.498984d0@pumpkin>
	<CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 09:11:04 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi David,
...
> > I don't really see why strlcat() should be deprecated.
> > Clearly there are many cases where there are better ways to do things.  
> 
> https://elixir.bootlin.com/linux/v7.0.8/source/include/linux/fortify-string.h#L346
> already says "Do not use this function. [...] Prefer building the
>  * string with formatting, via scnprintf(), seq_buf, or similar.".

Trouble is that all requires a lot more rework.

I might try changing the type of the 'buffer' to sysfs_emit()
from 'char *' to 'sysfs_buf *'.
Initially the types will have to be the same, but propagating it through
will show where it can be used.
But last I looked I failed to even find the associated kmalloc().
Eventually it could be changed to a different type.

> > The only problem with strlcat() is that it returns the 'required length'.
> > So there are some broken uses.
> > - fs/nfs/flexfilelayout/flexfilelayout.c
> > - lib/kunit/string-stream.c (although the preceding vsnprintf() looks like the actual bug).
> > There is also some very strange code in security/selinus/ima.c - but it may be ok.
> >
> > In reality the return value of strlcat() isn't really much worse that that
> > of snprintf().  
> 
> So we need strscat()? ;-)

Indeed...

-- David

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

