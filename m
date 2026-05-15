Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F463EB7FE
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830266; cv=pass; b=WqgvZUGMcFKBl6O79/l7UI5tYRJJfq+9vpQYLuCbQdvbDeF+/HS2LYj88GDDOUz1SAM+VNtfKvsaConRms3vFpVMKrQZGNAyxmo63VpoxfayYFXpO9RBDMj6IOnVk6njbjjsY6RUzIDw8wCYlVaHthWaHS+dcgtjYL7JpfJARcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830266; c=relaxed/simple;
	bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHDvYBizfb128dZdziYfRcAMFJLYbyAjci32B3PjPBCntd1jgYlyQBY7WsrJVn0l4rX1IraN1rShqUImAzHXBfhTMCfJDjoGZu3K8Z5R/bC3bPuVwCjgzSYoJUehWzVvc7rYo3Mso4xANnCRwWgTaW9WCoMHtEGXZDhmM0X+WBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8D5Ru4B; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8D5Ru4B"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso1138473a12.1
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 00:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830264; cv=none;
        d=google.com; s=arc-20240605;
        b=fZ3Ug1t7+2UZp4MIqeytJdLY+2l29+GdbRyHg0tUFnH7jLEM9fBmrG4WTMBdKBoPtH
         El10BRZ+LY2JxBPdcVLMLlkigYUCVZfpYipBuMxLronxkGznKHGvKl9XL/Wg0jjo3qlA
         v3Qtkl18M7HSwKMKc2G6pPcnqjKaI7hSva5IGA/gQ9QiB8FyqS0N1nXOBml0Ju+39NMl
         gUDia3i5tYY8B7HcET6/u77yGy88powlIi5ME8v6SITRj01ZYt9KHfOOL++5LfkSqfbF
         LLesV02q7YONpX79Vci6r5VKR7GEwAbbXDUg7/aEGd5fNTKpYISL84VhkUl/cY3kS4Kq
         HEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
        fh=b6iU13ldO0jElkmPYTtF4wShFKhqsbSDeRKt2Enw5cs=;
        b=lJRZAa6CWTRMIE+dS2ytFOQ6qgPUEXWu6ACoABOJ8RB/vaDyZVU3Xfp2dAW0RYf5s3
         ZDSWAIud6G87ItJ58IZLX8vC43c8zxv0b3Jht0IdckFSLp5sB0bz7cb8oGduNt9NYjmf
         qXE8ZwJnxlT2I7ia4tQWzk1RAFmmUONbLzGl6WhE/556Psc7n5zWNhFuRYCA150il/Wq
         LbmBg6//deOtXfZqYndV435tyVSw6eSULVIeN53XloHIx7+kDxwZq0YEgWQUQ7NZEyxT
         NEHcmui+7svNQY/gqpnDBsfE0ZgjizKBbPfhgzGyHOvmvUQhGBoYGBpbiXu3mlCKOxsG
         1nJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778830264; x=1779435064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
        b=I8D5Ru4BK1xwz8BKP94RYoBE/rsVfRV9RfJ+P3uQcMN+8qCXEznxiTeAdMWRS7NXjw
         FtDHUt6kHN90Zf0tYY8N5tx3ytta1lwIK18Vew+fQkXGiaGz8WOJqRXq00L4nQh49GTA
         FXl/hG1N8FSsxOAxL3nfmWeTRJRH1QOZULKfzrT4YDiAgNkL9LWPeBmLnQU3US6MpcNB
         i5UnNvEQm/ql9PK/o1xFc13DP6xgHcfnp+Ao/PV+EuVsyg4ZmUOvU6MGJl9/V2fUSQwJ
         Ni9J0kJlQ7shuBtqSMsS7HO8xHmD8XMlZp4l2BvwoDMZ1GFWL7/SkxtCsWr4YtLeozhM
         3rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830264; x=1779435064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
        b=AUCfc0HgVJoI+oYkgLpGhD9PHwCOAfx2p2dLCfEHMppHaR3TuzLHjwm+JIxK5yJrKi
         2b0rfBwbqeadyls2vAdjXRG9Hgmx40V+VYX9rbeNIEWU0pBSzWfHUAudTfZJ5wRv+L90
         kmGBZS0TDxhWs+QJVyRssCnRmasUeXeentV8w1DBIjRdZqNHwCiWo4gyBeqm9MZGn+7L
         1zcHkA0JYw79KdgW52BR/ef1RYefzGTA+2Zu77SLhMiewkUbvLdZJTjBm/GwT4qjciUJ
         st9fjv+KPOPNTslM72klumgOUdJR7wtBxQhB9YDcuQHGOXlbVX/0JjbU6Rn/jocaga0T
         O2pw==
X-Forwarded-Encrypted: i=1; AFNElJ8F9u5uYhBRZuK9kq8WJ/pmwgwuFIDw0LLNerRuWixSmOVdbWUuZWLbW+doWUTjGVUcEi16L417fMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/v+DNVvikGJvrMDdk7NEkiVHhWLiUiHl4l3LGBhnUUNOaF41S
	uaXwFWU0bus/fYqSZCJGP8Q1GHImQn+Zvo2byjBzIo10sx8ywAS+NjoMjmaHXCunyuZxahVkenL
	Ysru+6+Xm4rv5wRMgfLvKQdRrXeOVIxA=
X-Gm-Gg: Acq92OG7s2BqrJvGQqeC2OEhi+duUk0dJt9J4tGd7ZO0FbIypckpC1Ypcu9l3drfQSS
	EJFGMbw7v6QCPFwizew1YkZCroIAhTg1BqyPUWMqZkfu66Wm2buxKSIjDjHcFPjoTf/UZks8dIp
	kMgiQLd8a3Yy+ENWlWGWYTQKaNbKNe+UFhFV73iPSX6E0WbjXMoatJ0j/G3ZjG9EN0l2i0yWSK9
	Xxb1zRD9Z+EWL6xj9nV+NEJfOTq3/LEgi7PQ34I6k5p/AOhWYOX9Pv3n1OxAdwx38pocksMIXpj
	3Ltf+BKaOQa8zPkzeGBFRKUxmzdFLHS5PIkQP0fCk6KgKt/OdJpTw9OOkmWMJofX7R7rqZ5JR2V
	hUcOh9MA=
X-Received: by 2002:a17:906:fe08:b0:bd5:1605:e1c3 with SMTP id
 a640c23a62f3a-bd51605e354mr132586466b.1.1778830263318; Fri, 15 May 2026
 00:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
In-Reply-To: <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 10:30:26 +0300
X-Gm-Features: AVHnY4KscB1lPxN-vg0nJTVo2JmsPHnXDbsJElyR3pT2lQxI1VGvrffknfgi6hg
Message-ID: <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wrot=
e:
> > add kernel-doc comment to strlcat() function definitions

...

> > +/**
> > + * strlcat - Append a string to an existing string
> > + *
> > + * @dest: pointer to %NUL-terminated string to append to
> > + * @src: pointer to %NUL-terminated string to append from
> > + * @count: Maximum bytes available in @dest
> > + *
>
> Missing "Returns ...".

Documentation says "Return:" as
- the section (note important colon)
- the singular (however plural is undocumented and supported)

> > + * Do not use this function. Prefer building the string with
> > + * formatting, via scnprintf(), seq_buf, or similar.
> > + *
> > + */

--=20
With Best Regards,
Andy Shevchenko
