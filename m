Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F3B277007
	for <workflows@vger.kernel.org>; Tue, 29 Sep 2026 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698262; cv=none; b=MvIe7wnGj9L9R8D/n9IU84q6qAYxssOVYjhnabCvBk6V+QMfbfQCuBUNxkMLEyH8SErxqAJgBQ5qZ3Hw609rPW0UsAdfiQDScLhSmk2i/b0nGwHng33k2H8dKGuEOosAYYpwllND8zAaedtrdTljNMwZA+cbY0gfvdUu2xD/ulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698262; c=relaxed/simple;
	bh=4/8kHB6VsjavORXhGuMhJ8YPGNbzfwgAiBkRL5UB/Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzGdNeObgfPj3jDuD4JMRVU4vhUUshTdofORv/Ezow9ZaKXS1IvHugTiyrHCy3I8GFRR+J5hxTPaFH7V6bsStYAUl8i524uZRAD0Rm8WDdtD0eXDVxwW8JcgtYCzbBJe8tvYAz9Fl7FPzAh+3UuhOXdGXHE7C7hgr805az07YRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=a7eEIUCQ; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="a7eEIUCQ"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id DADEF3EAB7
	for <workflows@vger.kernel.org>; Tue, 29 Sep 2026 16:10:57 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id DD6543FEFD
	for <workflows@vger.kernel.org>; Tue, 29 Sep 2026 16:10:56 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 216B1200551
	for <workflows@vger.kernel.org>; Tue, 29 Sep 2026 19:10:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790698256;
	bh=q0EcYz+7oTChYGDHXMJMrvAXrlczc7nJkQML343vYQk=;
	h=Received:From:Subject:To;
	b=a7eEIUCQHJkqxyzqWbFJLI7obEe5jDKWzAbsF/MP62jJ1hENOdSN0u6tzc7XxMZEX
	 a5aMGa2MrkyfK7g+LMAmZNsLUj/hoGmiwDgRO34SmhzMtqkymiKzGWeAD+5w0h0nal
	 y9ab9LGU/BFhUedDFpsKBTZpRjeKBZ5T0JMs79UA0Th8IqOluUb0DxIxlSNTHE2dc9
	 DLy+hj//AqXGbcQchRbPvIpJLBVdli0prISFWTJ4xQYffePIGpjGw7Gd0ow1BtlZpL
	 zrQmQfvmL06wHW5dr2qptGxz8N7qjhZYGONxNRhHoxeWav79CEiX712Q6hFaNY/1z+
	 7L9FXkWSq6QSw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.12) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f12.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f12.google.com with SMTP id
 41be03b00d2f7-cc4d04d740cso1670048a12.0
        for <workflows@vger.kernel.org>; Tue, 29 Sep 2026 09:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByt5OToZYNVayWmR2x2TpmZqO0axntNevy/zsZplAhkfZQ/orbYqaBbFwHxwva+vJ+aUokWb21fzcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhyYWcmXyEn7ITVLqAPdI3sQYSgLBiG3+9gEd63y2PwZxyTYdG
	fMlKdYwvJOo7td9xkegD7cb5EI+ffo9u2PKkm510/f02QTUatnti1PhiHCmQJbh6RQWOqYARDfO
	UBLGGjktmTo/Vya5enRiViiNs9KhaMnU=
X-Received: by 2002:a17:90b:498c:b0:3a0:903b:f253 with SMTP id
 98e67ed59e1d1-3a09875d77cmr13557009a91.18.1790698254854; Tue, 29 Sep 2026
 09:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924134945.3095661-1-sashal@kernel.org>
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
 <arhtsrVb82vr6U-p@laps>
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
 <arkiyMt2NIydrPhE@laps>
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
 <arvFBqreU0qahkXx@laps>
 <CAGwozwEfN7cUZm8usUsSR2bu23ux57QCPxyXJRfwv0tU34gEkQ@mail.gmail.com>
In-Reply-To: 
 <CAGwozwEfN7cUZm8usUsSR2bu23ux57QCPxyXJRfwv0tU34gEkQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 29 Sep 2026 18:10:42 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHOttyNkC=sdVFCZYKZzhSE=cmUMgNd7cukpEE-WXm9Vw@mail.gmail.com>
X-Gm-Features: AclHuK-cO7DTMRVZGm19HLnVLPRtH-na_m7RlUN11kaLgDUCAfSjBFWHmzRQ578
Message-ID: 
 <CAGwozwHOttyNkC=sdVFCZYKZzhSE=cmUMgNd7cukpEE-WXm9Vw@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179069825631.2834478.8168229461271019133@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 29 Sept 2026 at 17:02, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Tue, 29 Sept 2026 at 16:02, Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Sun, Sep 27, 2026 at 05:24:46PM +0200, Antheas Kapenekakis wrote:
> > >On Sun, 27 Sept 2026 at 16:06, Sasha Levin <sashal@kernel.org> wrote:
> > >> If someone adds their sign-off without understanding what it certifies,
> > >> that's on them. We can't have agents add it for them just because some
> > >> people would ignore its meaning anyway.
> > >
> > >I didn't say we should make the agent add it. I said if someone wants
> > >to do it it is up to them. Not you, not the mainline kernel config,
> > >not this patch. And disabling it does nothing because the user does
> > >not understand what a sign off is anyway and will add it later or
> > >submit without it. In which case you get broken patches anyway and you
> > >solved nothing.
> >
> > Again, that's on the user. Your argument is saying that we should just drop
> > this whole DCO nonsense because no one understands it anyway.
> >
> > We can't stop enforcing things just because users don't bother reading the
> > docs.
>
> If it is up to the user, then this patch is not needed. If it is not
> and the kernel should make LLMs prompt the user to do a better job
> with DCO, then this patch does not provide a solution.
>
> I never said anything about enforcement and this patch is not about
> enforcement anyway.
>
> > Nothing is stopping you from changing this behavior to your liking either, but
> > at that point it makes you a downstream consumer on the kernel, so you get to
> > carry that delta.
>
> I am aware. The issue of switching to a mainline tree for upstreaming
> remains. Your symlink would come back. What is the solution for this?
>
> > >> If you think a hand-written AGENTS.md would do better, feel free to
> > >> write one and propose it. For now, this one seems to be working just
> > >> fine.
> > >
> > >No, I am fine with one not existing and it would be my preference
> > >actually. Ideally it would be added to .gitignore as well.
> > >
> > >That just does not address your need of steering novel contributor
> > >plus LLM, which I tried to help with. But if you do not want to put
> > >more effort than a symlink then not breaking our workflows is more
> > >important so this patch should not merge.
> >
> > All I care about is having all these "agents" follow the rules and guidelines
> > that the kernel community set around LLM contributions. I'm not trying to
> > improve the quality or make it more efficient. This patch is purely about
> > having the majority of LLM agents follow our rules out of the box.
> >
> > If you want to spend a few months trying to massage an AGENTS.md to the liking
> > of your LLMs-of-choice, then go at it.
>
> In doing so, you should consider the environmental impact and cost
> this symlink will have by providing an unoptimized indexing blob to
> LLMs which will also prompt additional tool calls. Then, the headaches
> it will cause kernel developers that do know what a DCO is or want to
> have a custom agents.md file, specifically the git errors that will be
> caused when upstreaming as the agents.md file will be dirty.
>
> I get what you are trying to do. But you need to address the
> underlying issues here. You can't just handwave them.
>
> Contributing to the kernel has never been "out of the box" and the
> kernel is not set up for that in multiple ways. If you want there to
> be an exception for LLMs such that they do a decent job at it by
> default, if anything to prevent a flood of patches with obvious
> defects, then I would agree with that goal.
>
> But in that case, you need to make sure that people that know how to
> use LLMs and know what a DCO is are not negatively affected. No, it is
> not ok to append 2k tokens to everyone's context or 2-3 more toolcalls
> for every agent thread. It is also not ok to have to do gymnastics to
> remove the symlink when switching to a clean tree for upstreaming.
>
> And even for novel contributors this is not ok. I am blessed to have
> the disposable income to pay 100$ per month to access LLM services.
> Even so, I have to make every % of usage count. Novel contributors are
> not. They are typically using free services, 10-20$ plans, or local
> models.  Those models are disproportionately affected by a poor
> agents.md file and so is their usage.
>
> I would like to see these issues resolved prior to the kernel
> providing an agents.md file or similar (if it should do so) and this
> is a very fair ask. I do not believe I am unreasonable.
>
> Also, the above is a prerequisite for adding a default agents.md file
> and does not pertain to its contents. That is a separate discussion
> altogether.

I think I thought of a solution that does have precedent.

The kernel forces you to have a local version file, otherwise it adds
a .test wart. At least on Fedora. So there is precedent for requiring
the user to create a file to disable some default behavior.

Similarly, you swap this series into a two parter.

The first patch gitignores agents.md.

The second patch adds a phony rule to the makefile that symlinks
agents.md to the coding assistants rst or similar if it does not
exist. People that do not want that, like me, touch that file. Not to
the current readme, please. Be reasonable. Yes the coding assistants
rst file is not ideal either but that can be fixed later.

If it is done like this, I do not have a problem with it.

To prevent regressions down the line if a template agents.md file
should exist but an existing agents.md symlink was provided, you can
symlink AGENTS.md to Documentation/process/AGENTS.md which is itself a
symlink to ./coding-assistants.rst and committed as part of that
patch.

Best,
Antheas

> Best,
> Antheas
>
> > --
> > Thanks,
> > Sasha
> >

