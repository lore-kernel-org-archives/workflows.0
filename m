Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF071B87E9;
	Sun, 12 Jan 2025 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736697195; cv=none; b=WdfVTZeIeP1xkgH7jMHf7WcvVp8leJki00XZyqtl0Zb1EK5K3G8R2HKQ1FUfortUEXvTMMl9MEgY6YWi3XRTr57E4GxKkQpAAhNz8Fy0/CKbgCrMCocWpFzWCGyJ7eEbnajPUAh6wZ9Ppzsmj9cXiLBSZNI5RjTU+ME4+t3kSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736697195; c=relaxed/simple;
	bh=XKtBIVcfYF7vCE3NonS7ml3BeozetTNvaD8SB5ergt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhNfe2z3EQZpNBOrxCCDZjFJBsTnPCRy0BJagYm3R5Oy8fzSHObvwrgkBOn2C/SfVa/k22T9CPimLu3NylrUF25D9WlJLex87A8e8bEpJmZxc9UMLCX8zErKcsTCHCxaiWPcdBvBL8Em9dLyw3LS+K6pYuvanTfFB6laTcbHNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so6748375a12.1;
        Sun, 12 Jan 2025 07:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736697191; x=1737301991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3x4xwrPgtF8mYskiSjFTuo3Zflp2B8uXfK32eBvHMY=;
        b=Y3hAW8CWSdpUrCZ9RYmTPHSj4gZfsv9SVwGspKGuEY0nnZFvrdnqh0hwU7ChzNIs5f
         swREVwFdJ38WajHSJ/0Mlr8KO+yZ4GTMTN1KI3FMOSofFhgS0uHz1eOOtgraMwXH6kcj
         ob6g96XBFgMhZ/oJqrOmezjktTAu1siXv69FKvotuHPldCItu6kJRB7upWH92fz0s7h9
         /Yy0Ew/MjMPbYPg2wAhRpBddg1G91443U/XGJp459C155TErEjipjc+KFaz7mJ0yQ+W0
         EvF4Gujvba8fWi3gtzpHRkNNkac2XvKk5x/sp90cDoInC3vssNS4wVCHsuOWW1TTpVEj
         YLlg==
X-Forwarded-Encrypted: i=1; AJvYcCU118pmXrR/MGE8tfOWalrM/DkU3HOBQ/FEDt+a4vxO76ngcT6fGvVWK1LeVePO9YYSKYk7SNhBOgpU@vger.kernel.org, AJvYcCW0i6zatIUbPqYskfKdamqetSrV8BErnjPZzRuuTmvHNjsA/+IhKB0Iu/O18pA2NiQJxjKNtvJCzeA=@vger.kernel.org, AJvYcCXY9yGtZ3I24DNvUxv4w2l54ksiNxyoOFUwOaFhGioPovVyMtfFCnb6FYeM3aFVl4e+j65wIRHwe5E6SYe2@vger.kernel.org
X-Gm-Message-State: AOJu0YxJba8LQZVIonZCFTu8+tGSuVNc6eWmsviP8V1uONYc3opvjhQd
	2ZAqChQhzElfcHW4I82yvD6VFyCcommKtesunaOmlnWi9p5p6H5wj32q1Y5trKE=
X-Gm-Gg: ASbGnctObBILAHuWjrjC88TJ5a45OwCMFfihaIMIHWHdg821Kyzul+nEfQKf5CeEVb/
	405Om5wzunXM4l7NR/O3KvKl0kGoKAObAr/vGd1ycU+0BPKMi1246YAa7vORDbzLI1wVxiCFzyq
	W9+tHuFnTz7Z7VlxnxrN7Wj1XV/ohuCw/qJamvlm/EQxcbEGA8xX+slbnPaJDL4/aFzHx99euvs
	aTNEUbDxP8ydjg2i76qpEV1KcF0gvXedJV0gPF9ofCkgRiXQPCs6vGfS/Yx8qjgogbA125k/cfJ
	LuBtQTkCKGo=
X-Google-Smtp-Source: AGHT+IEIOw3g8wjcznUOKDyjB3dyhtw6a+8q/0Z//HcKmjjw7TiAKCyvDLlUDYyiqyZPlckc00RJbg==
X-Received: by 2002:a17:907:d1b:b0:aa6:7c8e:8085 with SMTP id a640c23a62f3a-ab2ab6fda3cmr1876848966b.15.1736697191344;
        Sun, 12 Jan 2025 07:53:11 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c964dc9dsm390529566b.178.2025.01.12.07.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 07:53:11 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso6805618a12.3;
        Sun, 12 Jan 2025 07:53:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUs4KVuxoujJXKd81yOJK+zoP41c1rvCW9pykx9UUa9aMYHhueLNtCDdcs7cam+I5V/Mjez7KA45hqrCRH2@vger.kernel.org, AJvYcCXXCEEHafeDJOwO2byraV37pb0A44bv+FKFIcKoud7pwYNuGfws4249HLx8l0j/B0ZIiOm7NV2ScXx/@vger.kernel.org, AJvYcCXoZ8pOs8YTVkar9fqqiQ+OS/I0NZtKlP/7b4zGmrmy2LMuCkVqyVdZRFFYqzCqONutZwg3Zrn0mAA=@vger.kernel.org
X-Received: by 2002:a17:907:da5:b0:aac:431:4ee7 with SMTP id
 a640c23a62f3a-ab2ab6a8e99mr1653988566b.5.1736697190836; Sun, 12 Jan 2025
 07:53:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-2-ojeda@kernel.org>
In-Reply-To: <20250112152946.761150-2-ojeda@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 12 Jan 2025 10:52:34 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-qKHDvwzxB_5yTg=p_K6ON9_8LrUYw3OvGtBF-mjGsng@mail.gmail.com>
X-Gm-Features: AbW1kvY-uy6tr_CtwQsH_qQj4stu4DxhiqcHXV_FSmxTLN_RPZL6FE7-pv4wzFA
Message-ID: <CAEg-Je-qKHDvwzxB_5yTg=p_K6ON9_8LrUYw3OvGtBF-mjGsng@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: submitting-patches: clarify Acked-by and
 introduce "# Suffix"
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, tech-board@groups.linuxfoundation.org, 
	Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 10:30=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Acked-by is typically used by maintainers. However, sometimes it is
> useful to be able to accept the tag from other stakeholders that may not
> have done a deep technical review or may not be kernel developers. For
> instance:
>
>   - People with domain knowledge, such as the original author of the
>     code being modified.
>
>   - Userspace-side reviewers for a kernel uAPI patch, like in DRM --
>     see Documentation/gpu/drm-uapi.rst:
>
>     > The userspace-side reviewer should also provide an Acked-by on the
>     > kernel uAPI patch indicating that they believe the proposed uAPI
>     > is sound and sufficiently documented and validated for userspace's
>     > consumption.
>
>   - Key users of a feature, such as in [1].
>
> Thus clarify that Acked-by may be used by other stakeholders (but most
> commonly by maintainers).
>
> Since, in these cases, it may be confusing why an Acked-by is/was
> provided, allow and suggest to provide a "# Suffix" explaining it.
>
> The "# Suffix" for Acked-by is already being used to clarify what part
> of the patch a maintainer is acknowledging, thus also mention "# Suffix"
> in the relevant paragraph.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72m4fea15Z0fFZauz8N2mad=
kBJ0G7Dc094OwoajnXmROOA@mail.gmail.com/ [1]
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/process/submitting-patches.rst | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation=
/process/submitting-patches.rst
> index 1518bd57adab..c7a28af235f7 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -463,9 +463,17 @@ If a person was not directly involved in the prepara=
tion or handling of a
>  patch but wishes to signify and record their approval of it then they ca=
n
>  ask to have an Acked-by: line added to the patch's changelog.
>
> -Acked-by: is often used by the maintainer of the affected code when that
> +Acked-by: is meant to be used by those responsible for or involved with =
the
> +affected code in one way or another.  Most commonly, the maintainer when=
 that
>  maintainer neither contributed to nor forwarded the patch.
>
> +Acked-by: may also be used by other stakeholders, such as people with do=
main
> +knowledge (e.g. the original author of the code being modified), userspa=
ce-side
> +reviewers for a kernel uAPI patch or key users of a feature.  Optionally=
, in
> +these cases, it can be useful to add a "# Suffix" to clarify its meaning=
::
> +
> +       Acked-by: The Stakeholder <stakeholder@example.org> # As primary =
user
> +
>  Acked-by: is not as formal as Signed-off-by:.  It is a record that the a=
cker
>  has at least reviewed the patch and has indicated acceptance.  Hence pat=
ch
>  mergers will sometimes manually convert an acker's "yep, looks good to m=
e"
> @@ -477,7 +485,7 @@ For example, if a patch affects multiple subsystems a=
nd has an Acked-by: from
>  one subsystem maintainer then this usually indicates acknowledgement of =
just
>  the part which affects that maintainer's code.  Judgement should be used=
 here.
>  When in doubt people should refer to the original discussion in the mail=
ing
> -list archives.
> +list archives.  A "# Suffix" may also be used in this case to clarify.
>
>  If a person has had the opportunity to comment on a patch, but has not
>  provided such comments, you may optionally add a ``Cc:`` tag to the patc=
h.
> --
> 2.48.0

This makes sense to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
