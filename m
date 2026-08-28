Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA36359A68
	for <workflows@vger.kernel.org>; Fri, 28 Aug 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938549; cv=pass; b=JhSzmH7/9ok6ua8SJVyPKvRBlf/ibgwN7XBcDqU77XQN0WMZnU2ZUSZ3ZYwDSmbbtOjCi2IuKr70HFuyiD5cybt4WfRXE/b+AjFx8sll2xlEG/wagxbx6sNTaKnnwVbGXpB8YM/fYg/mQ7WBdQW4zSditFnLwifGq21n5j6nTAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938549; c=relaxed/simple;
	bh=QIwfG51FYqLbuC6hjumlOSKKDDgtiZ/qEfd/e4ujq2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7rTu2KDJIMicX78CeOC/HxOeStZXxdumx3tGSl6rU8HYk1IrSc9RlpZEQhhs3CV46t6Hg40Y2Fd341cLlLAhE6kOknIA4b7u/Hwgt7kAUFjQOLGmu3nnKcr3Ufo6ElMwqpOlcqIVrgE1ZXvzsj1VoKuqtLtR4k+IZL9EwE2z+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJbBMiqf; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJbBMiqf"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedaf975a3so203270a12.1
        for <workflows@vger.kernel.org>; Fri, 28 Aug 2026 10:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787938547; cv=none;
        d=google.com; s=arc-20260327;
        b=HGAjGS/pxTvzSCF6fJk1kxQBtNLG5cOjuk0xMUnsP57tGEX/IByjZMIBtiGxumKGOf
         SOOso/bxLKZOvZbOiwbanWvd0VSZIQ/MdXa9LCvbrlEq+5nMBgQyaqjpm68cVAHwg45x
         Kz/gDlZ7sNGQCbYXtBpqYT75Aax08AocgAz/VVgwp7eplUMSNxHTH5Rrjc0ymY5Cpy9N
         /KeOPJ6gWsdnzPrS63J85X3XXeUJy/ArohadBGa1U25qBDMn6H02uOBeznQpOPWtL3yZ
         I9RWm0NmTrZrSNilNZeKJZwhlF76oRnufKtdU2jckp1IjueLTBWQXdid3M1UFY1fAkPN
         vWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        fh=y+ogh1yDM4Bz1oOhDAwJGIiwq3r2rx1PUabMiTxZu04=;
        b=r0qscN1zt0BcDWWg9mJv+eb7aVkHI8n30lwvFP80Kb/VzrHWSACA9XxjwJxdi5PEPN
         EpGqvbStdxtos5SyTyjWdVOam8uYmm983QBZBJJRM2uLchGF6xgiufu5jIIW9MR0C49Y
         aaGdSCrWgrr5COLNOyMLPs+3Gy5T8czMCCOtBid153kU1qlHNAGjD+KTWHfJnAgLFQIb
         JNQMFaOxU6R1lX93oVBj7tE33NVYTjRVF4T1bm9JPWdwmkWRCnC8LUV3sN8bFq1HiK3Y
         zWGJRQS3KTP558q5ZkJ3HSPqMINeV/ewh1bX6ArZocAHP1q8O+SMtK+LZnTv0l38/l/h
         O1xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787938547; x=1788543347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=cJbBMiqfnfAzijPJg52XSJhSdf6VBAoIXgQABBtFTXeL9RWB1Otgdfb53SbhWsdc/y
         8zL9XSz8jn+XcKsCDxmpUzB2J0s1aubLdWKgF79Ise6dKeevXJKQaWls37MweKlfuGmd
         gIlU7fZcHXoM+CQbeY/sRY5ah8e79mCRpUjoFtfe3kjiIhG6s0b30vPleJUSLoty/jrM
         YyDikunxgsG23Iuwt7jTR/k4cjWh11mCnPkcZ2Mkv1R0CdEyfXCaGdmzoQwAXK7UU5a6
         XLVxkQbLoc4IOfFq+rM0yupntWHQubwwPKJ9jFiNbQAPw6/AiwZpTzewPMaAxvFrg6GE
         HIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938547; x=1788543347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=bUyHVXO45BE+0VOJ7QbOipuiIHYVnF+kbFK6gkbmCMcgWEzOK76+xBeLIxA3irWtKo
         M2gJfCMaFviiqfP3sIeRdyxYaO/GR/phBvVIC8pW8xZ6lBYRkkkg0DGSgRpgrKWzdoaD
         uuv5F0CejEkvgunCvz9Up6JisDSbIjxFks8uo2oDwKcvSBIBdimWNM8QgRXbHXS+mjNe
         smM1R4j3mFK5T6A0a7acVF7YEs6W7u+iXXdR8QQ8WexuwQDD1BmOmFM5uWKte0Xfivau
         Jr+wCABpBGwjDU3sq0z9veq3kA6sfY0OeJxsCw9/Y8CG6RGd3ukqR/oObWCEgwbCVV3D
         xrvw==
X-Forwarded-Encrypted: i=1; AKwUvBzeD+rU6BdLlNP6vUPxfdWiBI9eIXmjszPN0jfaYs844vOvbF3zhXpWQVgj69/x8FJjV/ZSWEjypH0=@vger.kernel.org
X-Gm-Message-State: AFuF++klj7h+Ze5QWyMyUSWipmVJKpau6UW0w3rCHDt4pKXxHA2kt8tj
	VYTEodX+VCoHk4kgoxoHUA4wW27VW9emvFW+rtx19KyhclXGrb9Mdl1ZREJIbRTGn058h7eapB3
	VfAGatMBz2mh/o5fWGxrAZrOI1kfcD0w=
X-Gm-Gg: AYBFou2wpnE84d3qZwphFLcfHSfweytx1mBt6vEW2a0aMQPP5RpBuDxj2YvWU6KuJ5a
	nizYEZw1HoOZ378tOUvIcBXBQfI35JHllftCzb0gdv6T9JBKD5d2Cfcdfv7Pkfnnj1YPuLa4Imz
	Qg74Q1Opde9cEeKOQTR/lOIs/X88EGWnwqeoNNO72Z3BxnYrLtC12XDTg4quB/DXvPPORvqFOiK
	/YSR2qlY+i2DSfT6cd1oOiePiA5d9Ilv1hCBqg+AKBOEdTO3D/h0BGSXsTV2bQe+cRQTgH/uVle
	9ss0Odyd1QPHYa2c0JoPginl6P+sSdKtTv61BX4YuI9dUxK6ZdFw61Hbv5hb7ThYl8G4IiWKmMe
	YSmPA79E2JKi9HIuy6HAwRoeJmGNqQHDOZ4/hRqsXmbm7kP7bk4gKF5srkoiaPtsCIg7ND94=
X-Received: by 2002:a17:90b:3c0e:b0:395:4df3:8800 with SMTP id
 98e67ed59e1d1-396d0c0ab29mr8371730a91.0.1787938547204; Fri, 28 Aug 2026
 10:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
In-Reply-To: <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 19:35:33 +0200
X-Gm-Features: AcwNN1WSwsVhEEVM3LRdqRtFMmDIpvaVESiQMW1HL_Bvm7itPlqfdlYEKO7mGmE
Message-ID: <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:25=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> It states Python 3.9 which was already older than the 3.10 minimum
> set when the container tool was merged.  Also my understanding is
> that it's not a hard requirement for all the kernel tools, only for
> building and producing a functioning kernel.  If I misunderstood this

I didn't check at the moment, but at least back when the "(optional)"
tag was removed, it was only required for certain configurations from
what I understand (I am not sure why the tag was removed).

In any case, it is nice if we could just say that it is required -- it
is quite useful to have around, especially due to its standard
library.

And regarding the minimum version, it would be nice to eventually have
a single minimum for all Python scripts, no? Debian oldstable is
already at 3.11, so I think we could perhaps bump the minimum already.
And Debian stable is 3.13, which from your list would be enough for
everything on your list, right? So we could perhaps set that as the
actual minimum for everything in the future.

Cheers,
Miguel
