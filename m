Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8224D4CC29C
	for <workflows@vger.kernel.org>; Wed, 14 Oct 2026 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985904; cv=none; b=gPrzBtg2UtQfsRZFAR5p4XDVQMUPO0jdPtpcLUsxrCo2M2xJwDQgT1tSSNUrQmL9hxugoKVBT0vg4nSliFRy15GM6/Zn3YykGTa95bAVRAR2Yzvq1xEUZlNhMCGij2PHYDLuUEbG1nCYAhYz7qOnBVlS3FWG9Md7R4XHRuzYOHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985904; c=relaxed/simple;
	bh=tgmSYRODldtiyEy+JXapeeoUqKtXmFc3P6QA8yFixoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CmZlpj3/kvCyObtgRAkeFfvl68G1YfTc2GFlxH6i09H5EhSmxpTd489krNwVfV8rY1lhidlzh7WBWaBsCaMtSqzPP65bNgB15zT2Tgm3qJac0RfY+MucodEUacPyjnpnXHHDXkC6fy2Uu/GcNq3a7cRm4XTDm9vvQWdYmIUyqjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c31a34de844so149544066b.3
        for <workflows@vger.kernel.org>; Wed, 14 Oct 2026 06:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985901; x=1792590701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IEXfd68nGcyHVRwrJJo9fpBrzQEvxp+Eo/L7XZpCrXA=;
        b=2vK3ptNbbzAssEk4n+EshxB9I19di50fSI1BvlesfqCBXN/p5qBfzw5nJcwsAORE+3
         goQJZ9STzWi9eikps2BGeEBn2NK1I/JlE/LmeO3Aqq/f3I+ebmO7bm7U76ZxHY6VMaCc
         X6mH3/66helAJPcpic2pIEtFJu5Tadc4E9K9YCOucx6N9/QlY0W9rVYmJbi5op0KAiGS
         TVFlM+OVKsId+DO5ZcuP8JkQWtQJeK6fCR6k5T1SChqV0Ooq2khHdMmnKJqni4dqfPnw
         7/8Hqj0inA6IwoDCCU5z5WKkEeTi7HiEcOzui2kkNAUoilBZizupuhjut/P15R7Z05Ye
         /upw==
X-Forwarded-Encrypted: i=1; AKwUvBxWWXifqghhYcpVlfN8PkfORD2IPYAbjO/baXJeq32pm/HdPBIl2pSPpml6F2QmUHtmRp8//Y9CGvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSbL0yWy0xeLlQgSQRQBWCeT9yJQjtAXIE9S55mYNfEzDZpXek
	qkOPAdkRGMsAWHfcCGb5wu/FbAWo/7VmNC0QvUKZKqTqSvW7Dz/DLOKLHlyGMa/HPX8=
X-Gm-Gg: AYBFou3dUkdCcDcKgprChbpXlCXuO8YvQLaUzdj03LY5kmg8/oxO38YkmRHZAO2F1uP
	eojHKXDDo2CBor06WdDhcqnLWGnIOx80zQ73FsVxwzPRFcqj21lLijn4nbzjtK6hBefV5qQsmwo
	LimQ9nqqDs54uu717c84lbx0oxZ2F1jDd7aEsdUr4yfEHg9tw+PHnnUkB9J7Y34is7CsuwJiLOK
	BjciwrLFfImx+CHzt4KRsok6f0qZ3qGnVwRBnC/7hehyX+MxhnaE8WlRHPkfIzoXu3xRqVNuheV
	YvyxwD5a+h26e21UP1brk8+Zmjgt2bns83Payglq4aAIGx/d1w/u3ELhNUHFM0rU51bvit3moMn
	7rQw4z1azXeJ0IxcGzGkpNwanyCkF2Q9XJmspBLn4sdlrQSwYgwdIKTCIXiW6zhBtYctVOJwHk2
	IO3Sb8SC2BTXqYHVhtSHbRMoLbIkHOlDyJGpffrO1CDfY9iIQ5IfXuQMyYslE+BxcDSJ6ySTBSJ
	xFU3/PQxbyknPs2qWryESf1bVr4/5FHslbD
X-Received: by 2002:a17:907:c07:b0:c2e:3d17:5259 with SMTP id a640c23a62f3a-c31aa0bf51amr1471341366b.41.1791985900501;
        Wed, 14 Oct 2026 06:51:40 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm716201566b.79.2026.10.14.06.51.40
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:51:40 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so1713624a12.1
        for <workflows@vger.kernel.org>; Wed, 14 Oct 2026 06:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwC/b1pLsZSDFyn2+XS9DQ7CY5Y9OrhgYs2Q3MfYIdant7ouQgwyiVzm0rZteHZZEMH7lxT9xFy14=@vger.kernel.org
X-Received: by 2002:a05:6402:3046:20b0:6b1:da03:d010 with SMTP id
 4fb4d7f45d1cf-6b1da03d6b8mr4816329a12.23.1791985900158; Wed, 14 Oct 2026
 06:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012213452.1863248-1-sashal@kernel.org> <87zewiy1sd.fsf@trenco.lwn.net>
 <202610122047.A9E381A@keescook>
In-Reply-To: <202610122047.A9E381A@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Oct 2026 15:51:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
X-Gm-Features: AclHuK_-G5twnGpuXtga5uzESM43gtwqSHGN6ArqXvmpzC19Pilix33WOTvsZNE
Message-ID: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
To: Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 05:49, Kees Cook <kees@kernel.org> wrote:
> On Mon, Oct 12, 2026 at 04:47:14PM -0600, Jonathan Corbet wrote:
> > Sasha Levin <sashal@kernel.org> writes:
> > > At the Maintainers Summit, Ted asked whether the stable trees have a way
> > > to deal with incorrect Fixes tags. Hannes estimated that 15-20% of them
> > > are wrong, often because the author ran git blame and took the first
> > > commit that touched the line [1]. We use LLM workflows to find the
> > > commit that actually introduced a bug, and others asked us to share
> > > them.
> > >
> > > This series adds them as agent skills under agents/skills/, together
> > > with a skill for writing commit messages:
> >
> > Time to argue for a more fuchsia shade of mauve without actually getting
> > into the substance of what you're doing...:)
> >
> > I wonder about the top-level agents/ directory.  If we regard this
> > material as documentation, perhaps the "skills" should go there too?  As
> > readable text, they might just help to improve human skills as well,
> > assuming we think we still need those.  Under Documentation, they could
> > be built into the rendered docs and made more widely available.
> >
> > Otherwise, if this is primarily a development tool, perhaps under tools/
> > makes sense?
> >
> > I lack strong opinions here, but figured I would ask the question.
>
> I was expecting this to appear under Documentation/. The agents are
> designed to read human text, so let's make it at least passingly
> sensible for humans to read too. :)

The expectation is that the agents are becoming better in understanding,
so more "instructions" can be shared?

If that is not the case, perhaps we need
Documentation/translations/simple/, cfr. https://simple.wikipedia? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
