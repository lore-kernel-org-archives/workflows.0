Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834431AF14
	for <workflows@vger.kernel.org>; Thu,  5 Feb 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297803; cv=none; b=ex/90fypHxYemh+5azIbYo2Vk0lTyhcSbaBfTW91PEPoWrILleNRomuepeoXRRlHF5pEUR2WKdzTLoCvZzQWkudxGrcndqNfi64SwB0oFkcNLGdzOkIXriuq8B6ERVJkDg6Ayxjzer2WHtNby+bKhUeNHgqyLrLHRK1EiIPTi1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297803; c=relaxed/simple;
	bh=PMM7c97R/drK3ewQAF+DF/VgfVSeDOrJp7PFhAklFVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnSZilrzENPz8tpLK4mAkQNJ9Mtlx6FH7Vp4tzw47soJzV7NiNitehzB2JoI563Artg4+z8LThpvw9cuX9zu0mfzPr4SYmdCBVI4vj+D+qD/9WXr5839HCnz9W/zdS4Rhy/ASIZtzpBCcE7zTCElLAn2YPOmoZgEouUBnDzhKm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5faa8a9d7b7so168157137.0
        for <workflows@vger.kernel.org>; Thu, 05 Feb 2026 05:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770297802; x=1770902602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iZaBgu/LE6ooqSSPYf4KAoNzDeR4fkN3eDnxP0i4eE=;
        b=pKxfsxep37T4hlNJuLuCATMNPMIf6b3FKqTSY/jhG3C7BpHcQRHI93S7H8V3VXAMe8
         LyfWym+9YBGZbqn8E8JgiNGoJozWO3kik0x5qhmjKyIMuStRp85oMvOtZ3HRzi3OBAl7
         0M4tf1d8vHSHDiRWuPpbsX+TQOa1q+MvFO33wL5q9StkobUHg11YQA4boacJiCj57Vom
         OmyB+hiRB9JsNTiQbm0qJ2Jo6s+LabvHupo592yDwvWsqy80nd8/0oZ43cnWFR1YcQN7
         4DYwsaynyW3V/niIBl80jM/RI1x+s4M4Lp38LosBp76pfD7AIxxLOBgBbDlo8Am2N9Ii
         cYeA==
X-Forwarded-Encrypted: i=1; AJvYcCXPakf5+HB07YycF50voxwsQLWHPtBiBFl9F3X4fg1A9aLbzyvjh6jCfH1xSRLeijEKdorPpCRWpuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbRpWcypbYdigkv2Cw9h5q/3dgdKbQFaLWBR1SlLH6lNuSemyQ
	gViQVgkTrmQZa3J3ifP/ewgL41lutiA44QIagQhszzvEOD508QQFFK8skMD2NywN
X-Gm-Gg: AZuq6aJ2yvkEhikLPd0Z0fbD8RjGmOAiBf3TynQ6irxTXZVD6TmfvHeyx7clEc8wFwJ
	Jr0/q9EEmO7qfUJnh7E8jeSKQGuC8+RMq+hOoRY7xPJjWwPClnnJ+MpjNW0lTqQkcrTM/kgrU2U
	DMkvBEuP1gnUcapMav6e4sMr5BCP94ZlUVC2W1gLCyh7mfO/eLDTN/qEul5b/BrUD40G1w4XQqG
	CbhCNOkcVXAxZjJ6ZEa6bqjTZoxReY+Qgy/IwPUev+O77kHDOkXtXq4qf/qjt80PyRSxNOd6WMb
	IoF2aWUfOb0DI2twKy0nJ2B6/jp28DfKC4miECRBpohIuG3YeqX+cvb7qkAR87WRXTpn/Sp/pUU
	SJEYlx7ffAPP7BbC1niAgaNF4a40tOF5VYp4y+lrI5Pd8j9Y8ELDWZzOOzTtwA0JkbHMMMrYvzr
	VKWp3dDYVHyDGkZwf2Ljxsw2gMX232L4EpKzrChiQTD+cix32dkv11
X-Received: by 2002:a05:6102:e07:b0:5f7:2415:1a82 with SMTP id ada2fe7eead31-5f9394e0039mr1860146137.16.1770297802117;
        Thu, 05 Feb 2026 05:23:22 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948dffaf5e5sm1646028241.14.2026.02.05.05.23.21
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 05:23:21 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5664634a27fso256907e0c.1
        for <workflows@vger.kernel.org>; Thu, 05 Feb 2026 05:23:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNlmQHSRKeVoKG8A9QiOm/KjTl+4+Dr/+QuSxrT3/LuG6RaIp/LCtpxhk0jjvbuaEMHO+4RYl2lZM=@vger.kernel.org
X-Received: by 2002:a05:6102:3f06:b0:5f5:4d9b:bd67 with SMTP id
 ada2fe7eead31-5f93948bf84mr1818118137.6.1770297800806; Thu, 05 Feb 2026
 05:23:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205115554.7795-1-amitabh@amidevlab.com>
In-Reply-To: <20260205115554.7795-1-amitabh@amidevlab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Feb 2026 14:23:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
X-Gm-Features: AZwV_Qh0a5h_NT75kZDoyAvwWdJrS77Gn494KjkZ5QmAqdy8rvo7Eq26c4lI8IE
Message-ID: <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update kernel.org
 docs link
To: Amitabh Srivastava <amitabh@amidevlab.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Amitabh,

Thanks for your patch!

On Thu, 5 Feb 2026 at 13:09, Amitabh Srivastava <amitabh@amidevlab.com> wrote:
> Update http link to the documentation about how to add a kernel.org UID to
> the maintainer's key. Add missing SPDX-License-Identifier to fix a
> checkpatch warning.

The first sentence states the obvious, but does not explain the
rationale behind this change.  Why should it be changed?  Both the
old and the new URL work.

> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>

> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  .. _pgpguide:
>
>  ===========================
> @@ -864,7 +866,7 @@ don't already have them)::
>  If you have a kernel.org account, then you should `add the kernel.org
>  UID to your key`_ to make WKD more useful to other kernel developers.
>
> -.. _`add the kernel.org UID to your key`: https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
> +.. _`add the kernel.org UID to your key`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
>
>  Web of Trust (WOT) vs. Trust on First Use (TOFU)
>  ------------------------------------------------

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
