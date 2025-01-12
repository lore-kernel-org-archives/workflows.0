Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB091714B7;
	Sun, 12 Jan 2025 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736696864; cv=none; b=KcErR6GNg7bwXf5KifikNcFGPNeK3R22OS9Vtz17Ef12kYnRgxGvLYrecD5NHXSRLkbs8KOHGGG3NTKHnACtlv6NiBj0C/a4d2tFd6he7BJXQUxmMs9KrBCK62AmDlMUUqBkwHZ5qK73hNC54pW60eLRDn+VKSbDkEX3RxmHYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736696864; c=relaxed/simple;
	bh=LXeZMhXpbNWXXCw5j0HTKXlK5NN4ENbRgYHtNKHteRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah8zaWC4aQisCOHin12fEbwst/X7cmiqAaOrMwfl1bVJjxV5xEma6M1K4mlOvmUglAHhd3Mh12zVKcr6LupxlsWTGvLV/mSLqZftQc3gVOrXs6Cc4t9EhlkFRjfSICN5mJkqrcGR2/zynuil0m2W1/bOArsMROFMRsTysGdxras=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so5892629a12.2;
        Sun, 12 Jan 2025 07:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736696860; x=1737301660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjyLEJ4LmDRPMeg7pmyVRbONKVM6G+SXKClWu3uonXY=;
        b=nN94T6Ax9eYrYD7fvF/Clqo4uC4O/X2L11k13D5eMBDeW1+dP4/ibGJ+LiQFpJpKgF
         xgl1FH/ENNar3E8GbIfcFFKu02y70A73rF2qAapkqWGDfGyMRPD8UEYVkmtkMoMXUbDF
         ivpuwGrFryABvUL61UNZp4Qwj39374k4wj1fSCOKYzkS5xMFsu5wAqvdyvOIQJ/754Ly
         9M8G3ufxZCYSBWjLoYlUytVQ2irhmP6dCa2wNCtGLWncAity6KkWFslQIYPsW54P5SDr
         AK/3FtoqeTcEmcjUPMjch+IGbs74CBRF1k3Zs8NPMjHkoEyjNenwISCcZjR/vGOy/7ag
         Hl1w==
X-Forwarded-Encrypted: i=1; AJvYcCVyx/0OeAhjLAIupVSTh9epvX6Taue3olU4DZKjkn0sHjHQMKdBH2JknLFdjJW1xaGB0Lbwumw8CCn6+y8K@vger.kernel.org, AJvYcCWHCFx5OL8C9O0rCnH4NiOzpLJ0TamSllYpqZvZ8Chlc+6Ia8YU7k6ikn0JqprjJWZk2BYSjETGhuB0@vger.kernel.org, AJvYcCX9Qxm1w7ZMP9ZTeNgOIwMwe/2xnQ34bN8gs2ImziLW1C3JiX4UD6Pyb/EGRUdC8Yl+Xvivc+x9eg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/19g0dyNe+Dc/WXS7PuJl3zrTMKqbLWz4Pboguki+hFDYmcn
	rRlgKpM7KOAMxkKw9/tR/zIQ5zsl2ILG9F0Ib2xxcHjZP+aWIOXWBSExcR6/wRc=
X-Gm-Gg: ASbGncvyFUUKNZ4g/7jA1BDqRtEI8hlW6C6Erw3VY9LCGHwi2d5/IGvPfo7cCydQSFg
	ddiF5zlEHU4WDCdcSiXFt2ciYvNrg2fSGo8ZXc7ej6yjDuAzMJYoJOGJULm+CdsbdaTl5d06B4H
	2aEa85rrvzhDtM0t3H82/W193qmt10hNAVG3AkPka2YT8wTf/N8zOliBcPD4Yf6i4qXh3MKUbhR
	BJzcRRRNYFl/6/ka/1D7bW93ugxNNMsg6BRaOo+cqWUKJLg0Lh/KuMAFyRo95QjRlDL2SPgOx2o
	yOaDXcJXV5o=
X-Google-Smtp-Source: AGHT+IFen4g+f+G4u4vkoTsPoMLdr7qPvfJGaAxYZaJ14Erb/X/r43xbc2CpvZWgWF4yR/+VzdGJjQ==
X-Received: by 2002:a17:907:6022:b0:ab2:b6e2:fcc8 with SMTP id a640c23a62f3a-ab2b6e2ff0dmr1204588166b.10.1736696860232;
        Sun, 12 Jan 2025 07:47:40 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dc59bsm383978166b.76.2025.01.12.07.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 07:47:39 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so697611066b.0;
        Sun, 12 Jan 2025 07:47:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+DeP9fJi5SsekSIGC/HScIZXnY0i/TYuJ6KlS8MqM/MdYFS4SrQe9HyVYEdfZKPaaOYUd586t3U0=@vger.kernel.org, AJvYcCVgQQV4kh95uF15M99xyHGQndP2lipeict94iPC1QB0y19+3set1b9Ww6WlzgmIOJRuY6HL0YE1/nAD@vger.kernel.org, AJvYcCWn8Zw57R9qGTvLPmCdnLApRQPpc9sAiKXZ79BLdLRF7tO2YTtzJyVCc49Dw+oAn69bDF1aU+wHVC0E0YwT@vger.kernel.org
X-Received: by 2002:a17:906:f58a:b0:aa6:b473:8500 with SMTP id
 a640c23a62f3a-ab2abcaafb9mr1563993366b.42.1736696859012; Sun, 12 Jan 2025
 07:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-4-ojeda@kernel.org>
In-Reply-To: <20250112152946.761150-4-ojeda@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 12 Jan 2025 10:47:02 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-Knta8BtYSbZgX8cZ9Gd-2cpDAUE83dCJZbTbqmSfcKA@mail.gmail.com>
X-Gm-Features: AbW1kvY9sYe2UFYvoFMKHsHDuhdS2s-k0EW0KFNp10f0YtNTJge0UUivViciomU
Message-ID: <CAEg-Je-Knta8BtYSbZgX8cZ9Gd-2cpDAUE83dCJZbTbqmSfcKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs: submitting-patches: clarify that signers may
 use their discretion on tags
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, tech-board@groups.linuxfoundation.org, 
	Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 10:30=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Tags are really appreciated by maintainers in general, since it means
> someone is willing to put their name on a commit, be it as a reviewer,
> tester, etc.
>
> However, signers (i.e. submitters carrying tags from previous versions
> and maintainers applying patches) may need to take or drop tags, on a
> case-by-case basis, for different reasons.
>
> Yet this is not explicitly spelled out in the documentation, thus there
> may be instances [1] where contributors may feel unwelcome.
>
> Thus, to clarify, state this clearly.
>
> Link: https://lore.kernel.org/rust-for-linux/CAEg-Je-h4NitWb2ErFGCOqt0KQf=
XuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com/ [1]
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/process/submitting-patches.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation=
/process/submitting-patches.rst
> index 7b0ac7370cb1..6754bc15f989 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -614,6 +614,10 @@ process nor the requirement to Cc: stable@vger.kerne=
l.org on all stable
>  patch candidates. For more information, please read
>  Documentation/process/stable-kernel-rules.rst.
>
> +Finally, while providing tags is welcome and typically very appreciated,=
 please
> +note that signers (i.e. submitters and maintainers) may use their discre=
tion in
> +applying offered tags.
> +
>  .. _the_canonical_patch_format:
>
>  The canonical patch format
> --
> 2.48.0
>

A tag must not be dropped without the tag submitter's authorization.
Otherwise it doesn't matter what you write here, the submitter *will*
feel unwelcome.

It is rude and discouraging to do so without their acceptance of doing so.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
