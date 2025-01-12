Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0414A4D1;
	Sun, 12 Jan 2025 20:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736712826; cv=none; b=PUNKLoK4et2Q8nIzjOQLDy/QjEgQeWm2nBbLXO3BwmiHrg05+WimhdzseinEf7ezvSMjP5VfgPMi3cxnN0T7ogHZEeZSva25Jt5i+Rt01ClodLsHo2FDF+A/OgdZz54vh0KVKUoH2qAXbxP4x/0d5sQUPXEz9fY0Fzi6g+kfRyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736712826; c=relaxed/simple;
	bh=Muf3z0isG+soYtWVUitdFt2H1GC2kKpxxukt7MKvCfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYbGgdntZTW2K6q8yZuT90Qlek2dD4ZLEG2fz+us7tf5YP5HeHgBuNVAzc0Z0/HKwwovA9DwyAC9FAj3UR/a/ClIOzmvqQb0bhUCAHLNVnBW8fyFEOJ31A1nCndA1JWbvyAws8Ou9AErOBU5bHIzAoPei0+oPHeJX82j+kXpHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so6025253a12.2;
        Sun, 12 Jan 2025 12:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736712822; x=1737317622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qj4Z2SDQvq3fGmtNpPU2AScGVxBCS61Rjutm/KzPYAU=;
        b=EgMH5y63Y1cTMsA9qSxjVNNvmKQEAAzv/V81OvwK1ZBquV+ZRlxcEehYmR2HI5YFPP
         3g1AzEX5xufoABCOCS9P5NJa+u5OaVBq/+r1KjDp9nDQhXUCE6SePRLWDbeQkCe+cvKj
         y9d5Yut53i1XMsiTRPPbFJXHI3vSWnFYCb6UEKe2AGEBYvNtrjv3XjSXlQ3Rs5Sw0xyP
         DEeKeYWpfTQDBwrY5zh9YQbFUQEXe5SIA32pDSm0j6f+rt258fljCyOg6GjlMoMzykQE
         tquomHH2L8uv15FlfssyEhEgXniDThQvINLEoPJEqDsB46etTAcx3fGGEPlI+u18xP6b
         vUxw==
X-Forwarded-Encrypted: i=1; AJvYcCUIlNkhNwFvKFDc8cCDafE5jtayfek4U3vtVOZlpF6n3fvNqwfyjr0azXe6wc6sFl0glgQlPtXD3fj+1wlD@vger.kernel.org, AJvYcCWGnPHQkVtqYYy1uavXJS8aMZQTCSaavixJBmIc0kHq/UjYnE93ETwupvOARS0KVvAa5xbpVuIX0as=@vger.kernel.org, AJvYcCX/mLuqgpCWPxZWmlzjdLollz7/iQ/OL9x9VcK6bf+HXkl+pb56LvXopa2aGvrq9TKQ6YOWY/1S9v2E@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxhldm/cVwmzwNdIIsCEKlfpqp2TVbTHEjWwXRmJrFUapD9lN
	ZdaZGUEp7dirhDwIlmWunpeDGXoJ7qrFbRnHfqN2UNH+CYL2/5k7db78vNMfLCM=
X-Gm-Gg: ASbGncuGLWXsuq+s+GoxZbmw+fRrOQq/iZi4THkLpOnOhDODm2vNabS8IVGJJ553G+n
	dzVKwvRs9CSt66acjhd540yuSwAPb5a3TJkCKqKrdSTBXsv21QdM+3wkgNIkCTC4InBR/1v7BRg
	EY50HpekZwsPr9InP4+69XaVNpCmiVrNpPWH27Gk7HLmuS+KkceWK9sItuVNoACvcAjK2uywLvE
	jGmN9qAuxF22nMYzkEwXra5nJLEc0SsWpRuGmnbN27qqqqwSxykwJw5ZPLA7zsHNhYxyoHB6hrF
	q7kWz7KQ3jo=
X-Google-Smtp-Source: AGHT+IFFtbNYQ1a43XPmLrnqfS+T2h1xFVZke/nZpdvLBk/cNf4dQ3h3YbTA3XOrbrzwpb1lbqFm+A==
X-Received: by 2002:a05:6402:13c1:b0:5d1:2631:b88a with SMTP id 4fb4d7f45d1cf-5d972e167dcmr18239394a12.17.1736712822358;
        Sun, 12 Jan 2025 12:13:42 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c3039sm4192634a12.40.2025.01.12.12.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 12:13:41 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso6038407a12.0;
        Sun, 12 Jan 2025 12:13:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9NQID2WW7SZmr7N7EKfmhp8xwcqnUrfsuNSs58+IIGo99hFomUpE0WbTgqYKm/yX94Yt43qRY7Rw=@vger.kernel.org, AJvYcCWPGUp6CcDXO5a3YZR5VO3vZmEN7Nj6R05QoJc4FoIBhQ/Ek44E+3yUS3BknRrWzv0ijBOzC1eojG5pyTYM@vger.kernel.org, AJvYcCXUv0BMT0ITlkpJLxK/GQUOiJDeLVS+g3HZXSwHdMrYzCXdCBHReQ0FqKxO9U95P5diGP0OKP2Q7b+A@vger.kernel.org
X-Received: by 2002:a17:907:1c8c:b0:aa6:7cf3:c6ef with SMTP id
 a640c23a62f3a-ab2ab70a362mr1619489366b.15.1736712821014; Sun, 12 Jan 2025
 12:13:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-3-ojeda@kernel.org>
 <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com>
 <CANiq72kQOrvi5=1RUScEpov79RNzA3vna9KW6MoYmj8XJZhpQQ@mail.gmail.com>
 <CAEg-Je9Cs54SkvhzbSq=2v2QYMo=mwUuGqFcs6cvi7nFgw6+Ug@mail.gmail.com> <878qrfdcro.fsf@trenco.lwn.net>
In-Reply-To: <878qrfdcro.fsf@trenco.lwn.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 12 Jan 2025 15:13:04 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-phx0EmhAYsJnmxZ-NKVhER6ddMZgXTbCVaqC+2jGSAQ@mail.gmail.com>
X-Gm-Features: AbW1kvY7CPJkAZ34-1s7jKPL5Kwhqxb661Axv4EULjtx6fvBdg8Uy7E2dA07D48
Message-ID: <CAEg-Je-phx0EmhAYsJnmxZ-NKVhER6ddMZgXTbCVaqC+2jGSAQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: submitting-patches: clarify difference between
 Acked-by and Reviewed-by
To: Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, tech-board@groups.linuxfoundation.org, 
	Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 2:59=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Neal Gompa <neal@gompa.dev> writes:
>
> > I've had my Reviewed-by tags silently ignored or deliberately stripped
> > because even though I've done a technical review, the maintainer does
> > not believe that I did. Therefore, what I am saying is that
> > maintainers seem to speciously decide whether an Acked-by or
> > Reviewed-by tag is appropriate or not *after* someone has sent it.
> >
> > This is the fundamental problem I have right now. This decision is not
> > the maintainer's to make, it is the submitter's.
>
> There *are* people who seem to make a game of getting as many such tags
> into the repository as possible.  I think a bit of maintainer discretion
> is important here; I don't believe that there is a fundamental right to
> inject a tag into somebody else's patch...?
>

I think there's a difference between not being collected in review
cycles and being stripped on application/merge to the Git repo. The
latter is something I've experienced before.




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
