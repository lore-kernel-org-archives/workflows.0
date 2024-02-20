Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29638482FC
	for <workflows@vger.kernel.org>; Tue, 20 Feb 2024 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708394606; cv=none; b=JlnWeIOuVPb3sFEz5na17Qzz7D27vdTbgWFTaCN4HwWXxexGKsUeLaw/RBJ+vydZC+QEp62VHebrSEkWw31DgItfKdXaEE5CSqFPF/5kTHNtLUTHIaMKOzaYt9cm0r9vv7BgDy1k4nbUP2ne+/btjptTSfBTTAcgWmeN9/E+A8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708394606; c=relaxed/simple;
	bh=Gnb6UeNF8wLVhpCMEWjPwUvIUTFBjSPitOiRpAHZyvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCZMJER2EwGhU6luPcxvywvCMLjQdL6KWTSFRG0k75N5yBCB9qUVkby59kwomubf56uOUpPLKKKindLzYeksdcXxCBBbtgT7IA/CKHTEADK6JPrwiGW/Q4Nb9MPCkOTlMCMfloe8m4p8GATJM5/Zb0SZPV12QvvhP7fNOmmURto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WgMAA/ST; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgMAA/ST"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-68f1423353aso17299066d6.1
        for <workflows@vger.kernel.org>; Mon, 19 Feb 2024 18:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708394604; x=1708999404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gnb6UeNF8wLVhpCMEWjPwUvIUTFBjSPitOiRpAHZyvo=;
        b=WgMAA/STiB/qvfjvjrG/jJSQULFr1MXAdizCjimynkmkLV7KrPbwCRuiqj+eFWlZey
         ENK+1pkkxNEnwLdt1jtnWdI/w26SjOALewXfv6MzeG6c3nNYUuMCOcjGHyoC7Ghki3yN
         407vB36XgASQLg716JXns1FdQ1183fA3seAMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708394604; x=1708999404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnb6UeNF8wLVhpCMEWjPwUvIUTFBjSPitOiRpAHZyvo=;
        b=gTmNBFta3MHbRUV9mukqh2eoVEAQfwB6CwGReTeCXQLWIwzdj4As0JkeUtJ08TgMV4
         DGpXDmDWmk7TGsJjtzsLmOpM9BpXmAJFfiVDtQD1fM2FOryzBLHX+vwXGQTLGwxz0xGd
         p8b841zltWjBaeiExlpNWOhXiMDBbC2is7J1gMCjczqBOW6CXX1IGrwb6RPo/RE0V1Bt
         kXNwJFIXRZTnA33+VVUG76oKqqzCYAgYZ+q6gJ1N10DdOpIKRNWsB1PzUEZYgjkqIKxZ
         R9wT+GhcW9v8ZUdOoIPNdM+z9PhQ8SMCCU0Bt0F92xWUQvLuQ+VrSYH89wOsRdD5blqz
         iOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQX4ow2xqJo5Ngc9zyB6HrdysbKD1peZE6VXM1dEm39KRSikWWMB3Ku3ZKN7LacE/+4aG29JoGZYINeE+Egv0YH3K4fPbqZuhj
X-Gm-Message-State: AOJu0YzWgQFacOJYKWQd/LVu3kw5v8y7w/3h6omBnNZRBHLkK3tm1XRz
	pSf4Xxq0Ry/4GHWYWKG9dygrK/Vb8m7QOg5JR72+TTK9Xxu2yCftGptePWy/jE0BVwCqiUcB2Tr
	ujl4QNVh8hJ2bkseZCqQD9Lff5q3B3d6DUf12
X-Google-Smtp-Source: AGHT+IGF6BQP5pn2526eKzx1V1UxSN69r2M8tzxCVxzYihvQCKzBXtYAv8IY9wOCr55gIl0rUtAWPW+D8gzwvDmYkHg=
X-Received: by 2002:a0c:e34e:0:b0:68f:301b:548b with SMTP id
 a14-20020a0ce34e000000b0068f301b548bmr9381595qvm.0.1708394603974; Mon, 19 Feb
 2024 18:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202173034.221790-1-sjg@chromium.org> <20240202173034.221790-3-sjg@chromium.org>
In-Reply-To: <20240202173034.221790-3-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 19 Feb 2024 19:03:13 -0700
Message-ID: <CAFLszThi29VCh2rKzvouW6rSpLq5E=uOzWLASO2-CE3Jw_1NUA@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] arm64: boot: Support Flat Image Tree
To: linux-arm-kernel@lists.infradead.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 2 Feb 2024 at 10:30, Simon Glass <sjg@chromium.org> wrote:
>
> Add a script which produces a Flat Image Tree (FIT), a single file
> containing the built kernel and associated devicetree files.
> Compression defaults to gzip which gives a good balance of size and
> performance.
>
> The files compress from about 86MB to 24MB using this approach.
>
> The FIT can be used by bootloaders which support it, such as U-Boot
> and Linuxboot. It permits automatic selection of the correct
> devicetree, matching the compatible string of the running board with
> the closest compatible string in the FIT. There is no need for
> filenames or other workarounds.
>
> Add a 'make image.fit' build target for arm64, as well.
>
> The FIT can be examined using 'dumpimage -l'.
>
> This uses the 'dtbs-list' file but processes only .dtb files, ignoring
> the overlay .dtbo files.
>
> This features requires pylibfdt (use 'pip install libfdt'). It also
> requires compression utilities for the algorithm being used. Supported
> compression options are the same as the Image.xxx files. Use
> FIT_COMPRESSION to select an algorithm other than gzip.
>
> While FIT supports a ramdisk / initrd, no attempt is made to support
> this here, since it must be built separately from the Linux build.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> Changes in v10:
> - Make use of dtbs-list file
> - Mention dtbs-list and FIT_COMPRESSION
> - Update copyright year
> - Update cover letter to take account of an applied patch
>

Is there any news on this patch, please?

Regards,
Simon
