Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573997;
	b=P37aI9a03tAZNrJqdIYMDSv8we9SBXiS2NId9hHPMcw26sCXFNzoFsjh00ZIJNNMWXt4
	 d8T3urv94CjDMlUiHcKdr974r2hgcgkHBD4Rs0pA2YX/KgYYTGWHlDahQxtJHzPJVknCP
	 jRXNh4YnSCGRZ6Hss5zxSly9Dgjr8K0Xg7N7KMhfsvMjdI7RdkyS76ZecI48k5M4C42j+
	 J+eKqvO+PcHkmP3O5vnhxU3oDdyrdBmT8ngmwMNsKCCjvDBG0Whv+Ckiq2Gjm98vLeYqt
	 AWVUNv6QpTf6EK0J/EjTnVIorutPrtMExELnJnX1fB87y7uFQZPugMGisbluWBLIkVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573997;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=TdukyCPcl9fUvggoegFEcLQWHoHKZ12f0CCAVKT3rYg=;
	b=z4u1HQ8jquutnjmzrPm+cEfE0+r98TRdK11fycxItaOMJFTfaqO2euqzIJQ074rq12Zz
	 lvvPVpVGV0eVO4HOHL2HM1JEJyGQocfPWX4z9xmjozuILhMvz2+0V4Xo6cUoubRO3ieG0
	 VMPPg+ALe9Wp30G91kQGeGATb7MnyDlmwpXQjdp9Ct0j6a3br9+X8r9HBHVPDJaSSHE51
	 8M9SV+upXYP6U51QyKMr2CexFG5dSRyBe/NExQ4jFBYNG5++VaAycIaL8pu7KIE7zvwgf
	 1wx7Gpn3QSMFJcczPQqVXzbYxR4sXKpim7cNLI20EVz4F/tG3+RPFAZ8DcYEE8TGtPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E08606A335
	for <workflows@vger.kernel.org>; Wed, 21 Oct 2026 09:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E08606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so268589e0c.3
        for <workflows@vger.kernel.org>; Wed, 21 Oct 2026 02:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573996; x=1793178796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TdukyCPcl9fUvggoegFEcLQWHoHKZ12f0CCAVKT3rYg=;
        b=bL2O2t7JkHfdmLvk3+Bu2bjlYRcuxBUgolIGXOwf2cPD7kYMHTyzS6giK+JO3E//nq
         akQsS+YKxHWXBRRkLlZjK9PY2bRNy7G1Lp0/a1HxwegjW93EhDYPOhRORfvATaFMfA1n
         s5SByjGj80CrO59zURdu5x3mDOFAgvbgGnAwxSLKuaHNYDgXHc+QIYkRLHtrCakeZF7Y
         xDErOWcEjtGAMfm3Q4faz6RV1qKM8TOvGGMAzXDftar0VoU24Pyc1rKXdCVhUVcfyYoG
         ilIii3H7bZP+o78WbiJprfj5dH95xmKOpHXItSJpL8bzJk8RpdPIW3gLK3emC+9TIiay
         wYyw==
X-Forwarded-Encrypted: i=1; AKwUvBwnSMpuz+8zmUoXsE6KtuH41Xp/nMKLA69StlTgyfW5L0d+SnRF3oqraPImuU+0OrmBfe8h4PlNWRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxsDRC6BPb9nEwtMpxXm6vPwYQIhLnsy+cnbzWeSwP8qKAP9IO
	HCoOZNVUqJIXt7aPzUGrNTnaP7Uedkge4TvsPF1TprHZWMnuQwQs4RFln4cWJgjRU1I=
X-Gm-Gg: AYBFou3/Vvlc0tKvxuT8FlBrDgF+lvCmc1Jwe/Ui+BJUQywuvDUbYiiR8MMVd6+vYUU
	sPRc913lQ0d5JQkLTKYk3GaFCnjmU/npptzQ5tNeJ160rOhASHdmwsHk2xgiNN/kVUK8uqA1Rhl
	9vbD2l2jkbKEeJ4RpEpcbykhd4ASBUjs+ZFuVjgWXXvZG3ZLNP9zA0lSZhSQO6W389zu4jNvmFU
	5M5RLOTTggyM/pa+lcSOYOnfhZGUvoUySILodt69FaqMoju/TON6SHB68fBJXlt6Omj825EDyYA
	vAEVOgNRsqRSY91PxzGL77sNSKc0qxRg9GJJFmM9eDE5EweCoSmN1Io+at78qdSRGLTQlhTF/X2
	YEVeVqPH5lWAQou5WATBMQEM4rvleo6X5Bh/sr504X4QtT9plMLxyOZaJ6mpUm9UNWL/96MGYhR
	Qpnles/9PkPplPrwdnnWbsMpfiOfhHkkfKgKyjO/WovOThKZgTBxlOU3t0VeZpzNZ43zbGeBacM
	5Y13T1K2ziT4IRP1dRPMpBs6eNaZfIQookTntL+sDw7oGongoFpP2OzEk5cDY26CufgV71Lr2Z5
	RrFeHmlyxI3PYGVLqko=
X-Received: by 2002:a05:6102:5348:b0:7cc:174b:f7c3 with SMTP id ada2fe7eead31-7cc92736121mr662637137.30.1792573995631;
        Wed, 21 Oct 2026 02:13:15 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d0b90b8asm2487864241.0.2026.10.21.02.13.13
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:13:13 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98c5876f2b0so258600241.2
        for <workflows@vger.kernel.org>; Wed, 21 Oct 2026 02:13:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGtn4bcpcyUIJoo0Rc20SEEf0vIO7vS3Xw0XHqqQSlti/sS+qe2oY7gBXFbPRHpIwe3Wz4l9QthRs=@vger.kernel.org
X-Received: by 2002:a05:6102:c4b:b0:7cc:306:d3ab with SMTP id
 ada2fe7eead31-7cc92473061mr657933137.5.1792573993049; Wed, 21 Oct 2026
 02:13:13 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <0605a3c99b55124d1be71c9939f636e2@perches.com> <ate3lqnWlk9zLZC5@mit.edu>
In-Reply-To: <ate3lqnWlk9zLZC5@mit.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Oct 2026 11:13:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmmRWFJpE=A18w+Jg+9T46Aeomc9NeCCtZR-MzaJW+Dg@mail.gmail.com>
X-Gm-Features: AclHuK-q1FSczAVmbAF3hXa82KzgGcPPTlNy2rnoWV3tKHuYqGppXvTDvgYY5ZM
Message-ID: <CAMuHMdVmmRWFJpE=A18w+Jg+9T46Aeomc9NeCCtZR-MzaJW+Dg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: Theodore Tso <tytso@mit.edu>
Cc: Joe Perches <joe@perches.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 20:52, Theodore Tso <tytso@mit.edu> wrote:
> On Tue, Oct 20, 2026 at 08:53:04AM -0500, Joe Perches wrote:
> > > This issue came up during the 2026 Maintainer Summit and the consensus
> > > was that "always include linux-kernel for every patch" was never the
> > > intent.
> >
> > That's not actually true.
> >
> > Lkml was the default mailing list and other lists were specific to their
> > interests.
>
> Historical practice for decades before the change was made that plenty
> of patches only went to the subsystem list (e.g., linux-ext4,
> linux-scsi) and it was *never* intentional that LKML was supposed to
> be cc'ed for all patches.  That didn't match historical behavior, and
> as far as I know no one was asking for that change.  If someone
> managed to slip that into submitting-patches, that was either a
> mistake by the submitters or the people reviewing the change.

Historically, not all subsystem mailing lists were as well-archived
as lkml.  Nowadays, as long as a patch ends up on lore, it's fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
