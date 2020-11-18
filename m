Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F58C5519F
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 19:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4476920853
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 19:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgKRTvb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Nov 2020 14:51:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgKRTva (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 18 Nov 2020 14:51:30 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67CC620853;
        Wed, 18 Nov 2020 19:51:29 +0000 (UTC)
Date:   Wed, 18 Nov 2020 14:51:27 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Evan Rudford <zocker76@gmail.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Is the Linux kernel underfunded? Lack of quality and security?
Message-ID: <20201118145127.16ecb072@gandalf.local.home>
In-Reply-To: <CAE90CG4N+orfJ2PUygWk3T8LDN+mHEjRz7qhz29MsyH9DOzv3A@mail.gmail.com>
References: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
        <20200105081550.GB1667342@kroah.com>
        <CAE90CG5MQM+8qX0F_RHmHwrh3fP1oxbtTym_tv-UhW2K3pYD-A@mail.gmail.com>
        <20201118131322.7bae7622@gandalf.local.home>
        <CAE90CG4N+orfJ2PUygWk3T8LDN+mHEjRz7qhz29MsyH9DOzv3A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 18 Nov 2020 20:30:48 +0100
Evan Rudford <zocker76@gmail.com> wrote:

> Am Mi., 18. Nov. 2020 um 19:13 Uhr schrieb Steven Rostedt <rostedt@goodmis.org>:
> >
> > On Wed, 18 Nov 2020 18:59:09 +0100
> > Evan Rudford <zocker76@gmail.com> wrote:
> >  
> > > This is perhaps hard to argue because the competition isn't good.
> > > To be honest, I feel that neither Linux nor any other "major" OS is
> > > reaching "high" security-standards.
> > > It is a fallacy to think that the security-situation is good just
> > > because nobody else is better.
> > > And of course, rewriting Linux is nearly impossible, but I doubt that
> > > Linux will ever become "truly secure" as long as everything is written
> > > in C.
> > > Let's face the reality: C is an excellent systems programming
> > > language, but it is like an "unprotected chainsaw" with respect to
> > > security.
> > >  
> >
> > I call "bull" on the above statement. This C isn't secure, is just a
> > blanket statement. Yes, C has issues, and so does assembly (which there's
> > plenty of that in the kernel). But with the amount of static analyzers and
> > fuzz testing going on, the typical C bugs that are in most projects are
> > well discovered in the Linux kernel.  
> 
> I fully agree that Linux uses many fuzzers/analyzers that are not
> typically used by a lot of C-projects.
> However, to claim that C is still "good practice" would be an insult
> against all the research on memory safety vulnerabilities over the
> last decades.
> We should not trash all this research just because many programmers
> are more convenient with C.
> In other words, I argue that we should avoid a hostile environment
> where new research-results are destroyed just because some people
> think that this is "not practical".
> Rust and other languages were not only invented as fun side projects,
> but because the knowledge of today is way better than the knowledge
> back in the 1990s when Linux wrote the initial kernel.

I'm a fan of Rust. And I'm all for moving to Rust for user space
applications, and perhaps even as Linux kernel modules (there's work on
supporting this).

But the Linux kernel itself is driven to be close to optimal in
performance, and for tooling. We push C to its limit. The Linux kernel even
does a bit of dynamic code modifications at run time. It's not about
convenience, it's about systems programing and pushing the limits of how
powerful you can make your hardware run.

There's a lot that Linux does that is out of scope of normal user space,
and the kernel is also limited in what it does as well (it has a limited
stack, and needs to take extra care not to overflow it). It limits options
of the compiler because it expects the compiler to be deterministic where
optimizations can break some of the tricks that the kernel performs.

I like to think of Linux as the German autobahn and everything else like US
highways. Linux has no speed limit, but is very strict on the rules (must
stay in the right lane, and only pass on the left, etc). When things go
wrong, there can be huge consequences. Everything else is like the US
highway. More lenient on the rules, but have to have speed limits. Things
can still go badly, but not as bad as when you are going over 100 mph (160
kph).


> 
> > > > Again, citation please?  I would argue that right now we have too many
> > > > people/resources working on security issues that are really really minor
> > > > in the overall scheme of things.
> > > > greg k-h  
> > >
> > > I agree that the current security-efforts might not be well-directed
> > > for the overall scheme of things.
> > > However, I don't think that security has "too many" people in total.
> > > It might be true that "minor" security-issues are eating too many
> > > resources, but there are still "non-minor" security issues that are
> > > not yet addressed.  
> >
> > Funny, I find that the biggest threat to security today is coming from the
> > hardware. Issues like spectre and meltdown, and everything to do with
> > parallel programming is going to be the new age of cracking the system. And
> > ironically, C and assembly are probably the best languages to counter it ;-)
> >
> > -- Steve  
> 
> I believe that Spectre and Meltdown are kind of orthogonal to many
> other security threats.
> Yes, I fully agree that Spectre and Meltdown need to be addressed, but
> I still consider arbitrary buffer overflows in parsing libraries as
> more dangerous than "typical" Spectre/Meltdown threats.

I expect that there will be a lot more vulnerable attacks in user space
than what you'll find in the kernel. Rust can help with that. If user space
is written more in Rust and we even have more Rust Linux modules, perhaps
things can get better. But there's no interest in rewriting the Linux core
code in any other language if that's what you are getting at.

-- Steve
