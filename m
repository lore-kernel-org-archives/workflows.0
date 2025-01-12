Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC271BEF6E;
	Sun, 12 Jan 2025 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736699771; cv=none; b=Ltpi+aJEe3a2GYbYER9/kN4rI6uhnJzuLYep3oL8IsFDTSloUEen7UUa7cZDb24Cx1ASUS9dRRfabS1hn40UJXp1j1pZC6x3l0M+EkXac77gbqABIRy9UlDnj6mSk9TggXJxMNVkKbUqcSap27Kw10TbkTbrngb+XuIan2GGlbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736699771; c=relaxed/simple;
	bh=3JtN8UOnO3UzsJ4wD1F2Qadp0yRNWF8iW+v76Oc1WZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfX0hp/Uo2BqvMrD0bDiB8fkOcIgityQTZAFy/NVy3GKcQbKQoWI6NG3x7hPVqchNo59lqW7IPA4YKN/yQ2Vk9351dJ5CEjN3/zb64T/pe3JZwOZU1hwXdntF9guUu4AAFpAL1ta86e1zQqxrEcJck0KOl9p9rwsRDAiHpKndSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso6403080a12.2;
        Sun, 12 Jan 2025 08:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736699767; x=1737304567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2MDuB8AdvR6eck9De9E1R9rQFdV7/dz1RZGo3VxOfY=;
        b=iJYjO8h2W/qBSZqQv/NQikkt069h+/wkYfhwcpYYaMAtDiFPIRZt/LJVZ+68cSqPzr
         YvlmMbfn/ygzzkEq7ywQj/0BPvSnNUAEtotXU6fjrB35bbJJT7jTz+kDGIwHgOZWxXDP
         U1cN5tchPTS3epYC65yrdDeVx1SblNOMMtnS6qUKsjX3VOL1jcAQOLwLBuW6VML+clNp
         fRi55uyA6t5FeBUaGZxK8xWVCMDRhZ5B2pD8/3zdfdw5WhpSZtlgYvo24J2z8fYqATdB
         dM/RVPlhTV2DpsQ4a2sfTM8ccQpbIv/po9IUd66U/72uAYr362UcYfRa20kGaTrMzY7E
         C9vw==
X-Forwarded-Encrypted: i=1; AJvYcCUCgQZWVx0WdiNTa+TSHipKYe1BDnJfu+oBqIU19LPgt0n4CFVb0umulGLxgSFJhOp48+HZFihGUXc=@vger.kernel.org, AJvYcCUDZ4I/YyO7oNaE1+ZWC1Ez8FEXLjuDxsKZ7pGyoxeapLCw7OFH1l8dfGtY9WxKkY7+E0K0hJs0S/Xv+TPa@vger.kernel.org, AJvYcCVAjvwRI/R6TMCcMWT4+0+btdNsL+3xPxqOYfdpF1Tv1pI9kG/aSrl/LWVMLx3AuNeaf2g4igW57pTX@vger.kernel.org
X-Gm-Message-State: AOJu0YwSktOlUsQvnWUpoObXZgxltKSWwnPa4XfrDwtzKbH01CSjbioR
	Ol6Sw8Sxx7lwDNZ6fuDSVSbVk8A2vFlXfGWztAO7Niw74Zd+2DQNM1aqc1HDO2g=
X-Gm-Gg: ASbGncuh4gD5Q19vTtIdip4zDm1kdezT2O3KQAZomAWr6YtabGfyuaWt465lt1c6u3f
	bFDryC9o1ADugGKqdmDWVfynw1sZ9hxGlT4UK2ABVnt7g1Fsm4LEZo6kurRpoIrebq5KVVEXpAo
	FOr2WwJJOIVTk7D54xefdRE9pFXngN8gY2PYs4+CR4Mhm5F1zFZI9S/dI9QzwHsOHQTHLyFuyne
	E4KTsjQbAJ++6FIrO0z3BSnqXAHIDtugq7LebXCcSHCoSd6v2EaobaIwzxu3ybKrdPQNn4TyHKy
	FCnKKl325cc=
X-Google-Smtp-Source: AGHT+IFVM5YhW0PUeTrWm4iA3fw/iVHmdclJt6VQefe1PdKXnfdFlm2KCST7hpO5Rm7+rp8WLlQ2ww==
X-Received: by 2002:a05:6402:13c1:b0:5d0:e563:4475 with SMTP id 4fb4d7f45d1cf-5d972e70305mr15342578a12.29.1736699766571;
        Sun, 12 Jan 2025 08:36:06 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c435bsm3779632a12.27.2025.01.12.08.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 08:36:06 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so749914166b.3;
        Sun, 12 Jan 2025 08:36:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLL6qJEeg5Jyszb6hlR4CuvK/UuwY100xJE/I05VYqp1nlntUsddX157K48Jx0lVD56z7EfmUQSn8=@vger.kernel.org, AJvYcCWJScomfLfZkK2d8UX1GR57qpCN4WG4KKSzzdzkZedI9y/HysdwuGqnbve5AcCSgsLNXSg8XWeHUk8BCm3I@vger.kernel.org, AJvYcCWXZ0o9V3vNqQrTG5QVH9Rgfms9Cz9qnOA3bZre4wRDqXY/3ENylyS9cHP1M9gGzCzWMZfh0GR5KaBt@vger.kernel.org
X-Received: by 2002:a17:907:3f95:b0:aae:b259:ef6c with SMTP id
 a640c23a62f3a-ab2aacfbb7cmr1734963066b.0.1736699765990; Sun, 12 Jan 2025
 08:36:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-3-ojeda@kernel.org>
 <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com> <CANiq72kQOrvi5=1RUScEpov79RNzA3vna9KW6MoYmj8XJZhpQQ@mail.gmail.com>
In-Reply-To: <CANiq72kQOrvi5=1RUScEpov79RNzA3vna9KW6MoYmj8XJZhpQQ@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 12 Jan 2025 11:35:29 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9Cs54SkvhzbSq=2v2QYMo=mwUuGqFcs6cvi7nFgw6+Ug@mail.gmail.com>
X-Gm-Features: AbW1kvaGx_MSJ3IPf7cryJeRayddnsNQNkHSEUemH4CYPXyC2A6fwg7vKUuHKAs
Message-ID: <CAEg-Je9Cs54SkvhzbSq=2v2QYMo=mwUuGqFcs6cvi7nFgw6+Ug@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: submitting-patches: clarify difference between
 Acked-by and Reviewed-by
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	tech-board@groups.linuxfoundation.org, Steven Rostedt <rostedt@goodmis.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, 
	"Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 11:31=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jan 12, 2025 at 4:51=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote=
:
> >
> > This doesn't make sense as a distinction. What defines "thoroughly"?
>
> It is a call, but when you give a Reviewed-by, it at least includes
> what the "Reviewer's statement of oversight" mentions, unlike an
> Acked-by.
>
> > To be honest, I think you should go the other way and become okay with
> > people sending Reviewed-by tags when people have looked over a patch
> > and consider it good to land.
>
> I am not sure what you mean. It is OK for people to send Reviewed-by
> tags. The original discussion was about Acked-by because that is the
> one that was usually used by maintainers only.
>
> If what you mean is that Reviewed-by should not require an actual
> review, then that is not the purpose of the tag. Please see the
> "Reviewer's statement of oversight" -- its first bullet says:
>
>      (a) I have carried out a technical review of this patch to
>          evaluate its appropriateness and readiness for inclusion into
>          the mainline kernel.
>

I've had my Reviewed-by tags silently ignored or deliberately stripped
because even though I've done a technical review, the maintainer does
not believe that I did. Therefore, what I am saying is that
maintainers seem to speciously decide whether an Acked-by or
Reviewed-by tag is appropriate or not *after* someone has sent it.

This is the fundamental problem I have right now. This decision is not
the maintainer's to make, it is the submitter's.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
