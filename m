Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF553E557C
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830318; cv=pass; b=i1IiRgS7onmtz3YhfbHDQQtDGIdrIQwpMSVw98EN3+xhLlVm0JlCo4ggOysrvDxPQVUE2KAmqPJPKmCqZkj455AlqAUWX64qa4iVCIZRdby68cW975PoZugFgTphjp1jMWUwo7aWTv++B6cBhHIyQLUdbB4sV8ikhD8X6Kn/+OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830318; c=relaxed/simple;
	bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktxSotFwuS7c1ELImzvcQWW3YlT9O7HNyEnIt9HOSIbwR+cIeMxAJuYakUIVceqqp4z2nHs4ogkJe1D0uw4jRDIfUK7b0V9tjlLB8J2PyHJxxwxqthy8sTEvzYJal0YQg07/mJ5XOtOXblUdMGM73IlD9zmlW9wpPCF/AOfaHAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXoYYfV0; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXoYYfV0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so14558856a12.0
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 00:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830315; cv=none;
        d=google.com; s=arc-20240605;
        b=BNTvOd2ARtNW0LV2/yCTSlxqjiqwTMiGdQLKVKoPy1kagYHEAbzTW1X/ZD8UYkAt9X
         PjQE4yUNxmRQnnH+L8QKzXRKnFz8HijIXoGAJmMJAeunND3S6EBg4El75TmZ03bFumfW
         RHVvcTdFR4FmRT3ahEK88Almt1qhsuYQFasj7z1rDAmpLyfRvyUItISMzRXDxU0Db5S1
         CVPgDoiOiG1r8+p9b/VfJLWwKPq3Ba5by0jDAKENJcprhNzAlKolGBKUpc7js+H8TaGb
         1lcbtw0bCV9vp/4/EZPQlgpI1PvsnCkQuigN+KFPoNPtfA7QGzfLjD/MlV55ogVDr2Jd
         zaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
        fh=2WUlAPXz8iChZYh1zU3F+uMXoM+gFO9tF0c87Zw+iXs=;
        b=U8G1fi+tIPCg7rABwWTGBXD+kAGkCv4uRtBCPg2RShfnQwVNfV2ab61dMJtW6ftceS
         vZNRKryaSyLyHSbqcrGsY6VdogmLVtu/hakQr1N0Zgq+h/mWCOrEJTJDfMRlhZ92zR0d
         wVPnpECzPy6TU6rFyxPuHio43vvIdv95sNP6fN96e6AsN9p3jetX8df2gCU90xPjB8eD
         /wmdzcz6u2mm7BaXznJl1UGf3RNqn2VxEVRPH1Vu+ukqFRhXCmO+aJIuybspqRskWgNf
         lg9A862gIZM1AlLIoKUkFFJHqyDDIAUaYOafGtQ8E7nyzgG3cuA18bfEgMF5wb7+NWsu
         4irQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778830315; x=1779435115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
        b=AXoYYfV0xdQL2EvM6lCogOlDWNQaeGF6nGq0rbBC2KD/F9/y+MTmaXgoA7LKsFuErm
         SwZz2/xIRXO9eIjHlWf89zUzVPGmkE4Hq1ADw3VdwdQiPaurNRIE0YYW0Qi8wD3wMHn2
         c2uk3rFQDKPDmEFbI/HYDC/W0nMtjsXFQLi3exTGjDV6hqgyCfcmDi9SUedm5zd2Z01T
         86zYgQkwWPuiR9zX4w50fBsVdpA44lc2j4OeDbmNOmz8LRoS7bdhjM3mFoXMC2HedO/t
         0uMk0ZJVnZZSwYP5WVmwqVoE3Wjxwzad8c2ftykQDvPkgDBNaAWaicoHDpok4ELi9JvW
         OpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830315; x=1779435115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
        b=bUr5tIqdaYAX6DrxxFI/JoA5qZ41V3bHx2A/hZZgAfk1qa4RfVaQDnme11dQNiHyw5
         a6r0S4uC1FakFIyVlSUp1nCbiFrFhID1/DaxvwFeCZiK/bplSiVlT2UpZ3xqOcDhvvUu
         rroY059dIHfFWoLWBHz50D7vKC8glKkmqXN4sO7l8VXqp7iN9dSuLDEovWjnQPlkvijc
         q5SsgLEX6hwc8SKw4XHS4uomewlGrndbOYpyg1dEsm0wgm48Q/+m2sxZ3ZGvg3O/q4qc
         bLOmI2lI23ajtrn7bd5Qu+r8djIxE9gBw0SCeszJxqaShIQ62PnYbeCdkIvlop0MLfZ5
         Xmlw==
X-Forwarded-Encrypted: i=1; AFNElJ8kXIA+LchgRJQf9hqFAHBv7tjPH3TaoOnzWFhFL9lRMHqRxorwNJPJt4ZiEjcoNVLlcCBfz9nNMxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzRhrCrg87sxdvrPhcp9tkS0mfSPPgKL3YmmPM8bFskBaIby0+
	Uu6zMPMT+XbsCNEgSmQEZUHeJvvJ8lUe/PNuhFnuVXtAl26jqgfGZKtvneXOrAlQo/BfAgoE0DM
	w8xxSnYyBEmppnYzdH8T8Y0OTFYCD64o=
X-Gm-Gg: Acq92OGlotUAhOKb/n+ONg1aFM3eGNL4vDhBMnsShjqS8SK4Cj9/SdFH4k870GZhgMJ
	CwnpPed5a2MDEqYS1JxwuQYq1/blN8kGQEMV8V/DDXgSbi3XOyf12SPItSFHEZYRy2GoUwd1rva
	KdgNBQHZM0WXFAfnhdQ3XK7XXowFiab20YA9P9+XeYVGlvs7Jzu38f2o0PXZfZ3zJU4SO0K01D1
	sJS4US6rZg+qWrvOpTs/o5iZoKDHqz29WvafbmsXPH1FSy+erpWzc80fRX2nfkZC2KkGvLhofVa
	8icvradY0EDnzamr+/PQacqqGCKTX1AMDgjr56ycsDTOujKywbMZdsG9I2MSacw8vL6UlFNnRfG
	0sPddmKQ=
X-Received: by 2002:a17:907:9802:b0:bce:804f:f199 with SMTP id
 a640c23a62f3a-bd517aaf35emr124360466b.40.1778830315236; Fri, 15 May 2026
 00:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
 <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
In-Reply-To: <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 10:31:19 +0300
X-Gm-Features: AVHnY4K3RmWomzVU2dlVSzNVcpQvqzGa2-vhlNceUIfF6GpAdlsduEN_ocTMzyM
Message-ID: <CAHp75Vdng_p2w4LLLd7midQWJ1FnMLBOT7p_gfOi2evjbSEUDw@mail.gmail.com>
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

On Fri, May 15, 2026 at 10:30=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wr=
ote:
> > > add kernel-doc comment to strlcat() function definitions

...

> > > +/**
> > > + * strlcat - Append a string to an existing string
> > > + *
> > > + * @dest: pointer to %NUL-terminated string to append to
> > > + * @src: pointer to %NUL-terminated string to append from
> > > + * @count: Maximum bytes available in @dest
> > > + *
> >
> > Missing "Returns ...".
>
> Documentation says "Return:" as

I mean the kernel-doc documentation. Here the section is missed and
needs to be added, indeed.

> - the section (note important colon)
> - the singular (however plural is undocumented and supported)
>
> > > + * Do not use this function. Prefer building the string with
> > > + * formatting, via scnprintf(), seq_buf, or similar.
> > > + *
> > > + */

--=20
With Best Regards,
Andy Shevchenko
