Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965753385BC
	for <workflows@vger.kernel.org>; Fri,  9 Jan 2026 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976432; cv=none; b=J2WebMOJkY6Ygst9kod+PGDApnnTg9jDcuzVSD3mM5eoHtpz7fo6UAbdCQ7EF0c2PAbSAmsffPf0YIqFDRQDqpbRgct3G3A39M3NCCrO5TXdmtsjbrfZX33t4rZprd6aAF0As19JquC1BmhbEPH8o02FyYsoPIocMQn3MHRsitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976432; c=relaxed/simple;
	bh=uv4N8WCxqirDaDiJi9ylGK7eD5jNkl62arIAHY3Au4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cc35Ph58YWCRJi5Uk8fUQU8rFDfZ2HJq0mlHDwPoP4bO5r+ABDGr3i4QvaTXmR7oOemqm2S8lkYI/WXjpYrvZeRrVz7810UEQabL48QYB+PXcXurcOV5sIc9voiRTGt70dOQoSxXj0a5+E81RqdMe4okidNN9ip/kQAn9t9243A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ns37zwq4; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns37zwq4"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121b14d00a5so339790c88.0
        for <workflows@vger.kernel.org>; Fri, 09 Jan 2026 08:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767976431; x=1768581231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv4N8WCxqirDaDiJi9ylGK7eD5jNkl62arIAHY3Au4A=;
        b=Ns37zwq4vMV/Np+DnLBnaTyE++CoUeGUSdTUuu2mrN0ZruYLkSlc9w2ALh/pYQjtLS
         ILFZ6t47ta61D96fufwctDxEzsSzgWBYFLj6VDhp/5uTwIEtuaTTxcaNffM5WbZ8VNtY
         Gfc/5vSIKQDD6wSOhGoEFzntGodqVqv9ws69JwKEc7q/UcCEYQX57Fli0/CMsjxrqmY0
         wyAce/hXTkgU9UoBIC+ukVL+Ffn9RCDwoIJgHhPeI/0pCsOml0IjYzSeF33AweB3PbF0
         6sElf/FodF6+xLP+aJv6V+udLbDH6u6fns/90tm/AqA+dBhjWUZEaUGyN7Ul6E+e6W6J
         IUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976431; x=1768581231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uv4N8WCxqirDaDiJi9ylGK7eD5jNkl62arIAHY3Au4A=;
        b=gR7gPJQ43Cf5NoZDJlkReWXEGfi8VIarFX8Qwm9Zpa7RndIMZWztPXm0dCwkDxtzif
         Ad/or0wyA6TrYDbKCuAC+WFOyP2Z9BeQUW7iemPbrYpj45B/IFSVjGYRQvOEpt9/wrAI
         z6kvNIR2iFtwJXvrMPiR7wCQ7hHBj6UiFNDgBnchAdumLqnVdYEQw2C0dfhgDOly/4Kw
         9ygRZ9wd+hfvjpoQoYSiRNogkrzzN1ccdBdg4L8zKHVXJI3sz6mGu6jTV1x3t8F/KbDw
         qOqw8HHRWYr33J3pq3hcma/WZruJkse9F4/lVX5+uSX6+wh49mFoLcrd7TG9FGhPddMv
         Xkxw==
X-Forwarded-Encrypted: i=1; AJvYcCWlIZHwhds4Z6dCO2Md1TVS9QeVZbSgxKbgaMIlvvlHPx2cHBpjajFrS5vJPV/EXvJaSHSZt4SxKNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5C/soqYVRwUp1pnCprVPnNtIDOitn/9QbbLl1B/te+mfjEbwg
	jcwJ8qTV29BnlILH5KSwwtAsGErtofWsXpkm6Y1wFL8JckqtbftCZQFIbNGK+w54+lQ7isK/gh2
	JEyno1X5BkMthPH2yXa6d82DlT+m5KTw=
X-Gm-Gg: AY/fxX6FZSB+4wuzR4bWff9GUeFguWHh+nohVgDOAfzlzqU1llIxfHagm6OzPukSgk6
	gqmbi0pPcmbxTRr1Lc+Cpsmr+frN0m8n3NFQi7DOcKYyeqGi8dBEsfN7VxtYiUW4gv6u7wgqMHT
	cw1ERgPBS4yRE443v2Vl6zhApuUrC2M1jZc4ZMkx/1cNSrNziE+l3kcMaQaTNzX+bJv0yoAkmQh
	fFOin3yJMJhiGpu8yPjgQS106eSSuSeMr9+qoowzZY8GE1TQx2gFxJ742uvBndPpFCC0fiIa2fh
	P7xZE060mDUBOiGnKo56D+QvxRBi6Uvl3ppYmFF7DEMZmSl9rQkv0oQ9fxZHA7kiifrPNrUamoW
	kaUaZ59aDA0dQ
X-Google-Smtp-Source: AGHT+IEjU3/kJGOtPK4YL35P03625mkvXRPZFko4y4f+QMx+9mg7IfKKpLVoOaWxcQHpwaDZ7iBFYlfkuKiPOLyhOs0=
X-Received: by 2002:a05:7300:2154:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b17d34ee36mr5478630eec.8.1767976430783; Fri, 09 Jan 2026
 08:33:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local> <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local> <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local> <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain> <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
 <20260109085446.GA9782@pendragon.ideasonboard.com> <20260109105104.57d308f7@gandalf.local.home>
In-Reply-To: <20260109105104.57d308f7@gandalf.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Jan 2026 17:33:38 +0100
X-Gm-Features: AZwV_QjJwaXXKSwiQi8MluNd2x3mpci_pDnE1e-RLQenqw0FAlzgw9Aeuqp5h6s
Message-ID: <CANiq72m0_m4Tcn4YZvw_4cKjqsrJCDcfobLnt=Oai2d8y5FyBg@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Jens Axboe <axboe@kernel.dk>, 
	Dave Hansen <dave.hansen@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave@sr71.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, NeilBrown <neilb@ownmail.net>, 
	"Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 4:50=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> In the TAB, where we started discussing this (and I was
> supposed to be the one that wrote the first version, but thankfully Dave
> did a great job at getting it going). The focus was to be to document wha=
t
> we currently do in practice when it comes to tool-generated content.

Yes, that matches my understanding of the TAB discussions.

Cheers,
Miguel
