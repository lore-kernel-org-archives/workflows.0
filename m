Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UXm8uYZ/"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3F8D40
	for <workflows@vger.kernel.org>; Tue,  5 Dec 2023 19:55:01 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d3644ca426so64624697b3.1
        for <workflows@vger.kernel.org>; Tue, 05 Dec 2023 19:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701834900; x=1702439700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BsR8qY+uS6/BsLD1U3jPPzDAagYHPNv5M9ReQzqjMkA=;
        b=UXm8uYZ/Xl/VBZ/flQFs+9dAjL8MxLfaV1SwXude+vyG7dViCJ20LbYT4CQUaXdQFr
         fetTd2xYcTrMmRoc2jpfsvdKFz+fBWlPhE4CEIuG1FJ7VLs5Iu3/o6sr2F61CeOPnDky
         7TVjn+/jo9MjtLIgnTeHDtHwyNNDRS6XzCia8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701834900; x=1702439700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsR8qY+uS6/BsLD1U3jPPzDAagYHPNv5M9ReQzqjMkA=;
        b=SelEWIrgPHpUoRFvySFmie5J+/iD21k233t0kCMvuiWWkTVGHNoqx8St33LB3hK5Rz
         tPvQlv0/W8CIlc0aaakpswElCNfBLXstEvDU4oWmtG+MntqylDO+e1ROEi6vapTaXbo+
         9f5ZiMJzNYhBbHHYChYo4X7RClzYrlK5b3Olp35I+m8RAfCunpm5O9kPN+G8NnjzqJhe
         bQob8ZEhWIm5iQf6I6ZAfRQyODro54h1KgQJiUJaYXJ9UzefMrm7JUKgZNaQPkGjZAKt
         vw5jGZEJYbRynA4tvhSWL8gfnD8F2mIJ5MxlzlY6NP4GKf0LhscpFQ5D9+V6CjZ1E3my
         e5BA==
X-Gm-Message-State: AOJu0YzPwHsLj6J6W1bJZC7PksA+PiHQQ4UL6bTQSlJ4zUI2XysxjODz
	cki/hmh3SynnnvBs8bZdxPkkdrYuLEN+wyQVjVz5EA==
X-Google-Smtp-Source: AGHT+IHoRbTJaveVc4lI5CNcK45wkIN9hGVufXmpLxm2ne2EuM6HpHaABsrXS8hPPj5d6lQhPotGKPmzPUEdXOur9Ro=
X-Received: by 2002:a81:6dce:0:b0:5d7:3104:5649 with SMTP id
 i197-20020a816dce000000b005d731045649mr174139ywc.3.1701834900083; Tue, 05 Dec
 2023 19:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <92a3e3b4-6f4d-4ca4-947f-db905f328d4c@pengutronix.de>
In-Reply-To: <92a3e3b4-6f4d-4ca4-947f-db905f328d4c@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 5 Dec 2023 20:54:41 -0700
Message-ID: <CAPnjgZ3QZh3+2PtmSvje=KAw1n1o_jmhgC1ZnhM9JBoEjLG+fQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Ahmad,

On Tue, 5 Dec 2023 at 04:48, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Simon,
>
> On 02.12.23 04:54, Simon Glass wrote:
> > Add a script which produces a Flat Image Tree (FIT), a single file
> > containing the built kernel and associated devicetree files.
> > Compression defaults to gzip which gives a good balance of size and
> > performance.
> >
> > The files compress from about 86MB to 24MB using this approach.
> >
> > The FIT can be used by bootloaders which support it, such as U-Boot
> > and Linuxboot. It permits automatic selection of the correct
> > devicetree, matching the compatible string of the running board with
> > the closest compatible string in the FIT. There is no need for
> > filenames or other workarounds.
> >
> > Add a 'make image.fit' build target for arm64, as well. Use
> > FIT_COMPRESSION to select a different algorithm.
> >
> > The FIT can be examined using 'dumpimage -l'.
> >
> > This features requires pylibfdt (use 'pip install libfdt'). It also
> > requires compression utilities for the algorithm being used. Supported
> > compression options are the same as the Image.xxx files. For now there
> > is no way to change the compression other than by editing the rule for
> > $(obj)/image.fit
> >
> > While FIT supports a ramdisk / initrd, no attempt is made to support
> > this here, since it must be built separately from the Linux build.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>
> kernel_noload support is now in barebox next branch and I tested this
> series against it:
>
> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de> # barebox
>

OK great thank you.

> > +"""Build a FIT containing a lot of devicetree files
> > +
> > +Usage:
> > +    make_fit.py -A arm64 -n 'Linux-6.6' -O linux
> > +        -f arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.itk
> > +        /tmp/kern/arch/arm64/boot/dts/ -E -c gzip
> > +
> > +Creates a FIT containing the supplied kernel and a directory containing the
> > +devicetree files.
> > +
> > +Use -E to generate an external FIT (where the data is placed after the
> > +FIT data structure). This allows parsing of the data without loading
> > +the entire FIT.
> > +
> > +Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
> > +zstd algorithms.
> > +
> > +The resulting FIT can be booted by bootloaders which support FIT, such
> > +as U-Boot, Linuxboot, Tianocore, etc.
>
> Feel free to add barebox to the list. Did you check whether Linuxboot and
> Tianocore support kernel_noload?

Only what I was told by people in those projects. They may not even
look at the load address, but I am not an expert on that.

>
> > +        fsw.property_u32('load', 0)
> > +        fsw.property_u32('entry', 0)
>
> I still think load and entry dummy values are confusing and should be dropped.

This is what the spec requires at present. But I agree we should
change it. I will dig into that at some point to see what is needed.

>
> > +    with fsw.add_node(f'fdt-{seq}'):
> > +        # Get the compatible / model information
> > +        with open(fname, 'rb') as inf:
> > +            data = inf.read()
> > +        fdt = libfdt.FdtRo(data)
> > +        model = fdt.getprop(0, 'model').as_str()
> > +        compat = fdt.getprop(0, 'compatible')
> > +
> > +        fsw.property_string('description', model)
> > +        fsw.property_string('type', 'flat_dt')
> > +        fsw.property_string('arch', arch)
> > +        fsw.property_string('compression', compress)
> > +        fsw.property('compatible', bytes(compat))
> > +
> > +        with open(fname, 'rb') as inf:
> > +            compressed = compress_data(inf, compress)
> > +        fsw.property('data', compressed)
> > +    return model, compat
>
> After Doug's elaboration, extracting multiple compatibles is fine by me.

OK good.

Regards,
Simon
