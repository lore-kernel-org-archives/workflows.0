Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AB6C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 22:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 090DA214E0
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 22:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570745147;
	bh=dQQdhH3pims9BUZdo+UYirmyT8FJOJAil1+FFfBiq70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jGJUSix75Fwe38nimFdhSoSfUdNHGWjy0FVz8C8NSzb6wUrsCqk3ODroq2hcLF7fR
	 GGC9keO2lXny2Q0Urd0eZ8Je3tpgDesUnENWHsyJA3DdASjA8LzgomtFqarNV+5qSs
	 N7z5EvByQICS4M7v07dkpDXwFoeKf/e0nBEXaPtY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfJJWFq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 18:05:46 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]:33359 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfJJWFq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 18:05:46 -0400
Received: by mail-qt1-f172.google.com with SMTP id r5so11070863qtd.0
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 15:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bkQ6+wv6ErTZOy2lBu6ShFrdn5bxsFh/WN8ifojOdVE=;
        b=PT+InyNjEVMEfIiZnBNQwIuc9Kn67I3THPMf6b8t/leSCB2bLMCht4XftvwA8gPWIL
         zWg8xv/ma00+7z4g83kTD5HeuOSpy6q80+ZbJkRN/fji2COvb6LsAIDq2TnWkQ8q7FwC
         iWpO6LOFj9LDIXBXrmCftxY3Fk7zndhm0MC7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=bkQ6+wv6ErTZOy2lBu6ShFrdn5bxsFh/WN8ifojOdVE=;
        b=RLI5CQBuzchiy8Gfvf1vY+Rakd0j1KJJcv8zp9P1Y0y6aJmb6vaVIjiMoYbnvHketu
         0YlVOkLoW57FKIhC8vkVhIrzdrndTF265PZ8GypQZ58t/orC5Xn02KFuLw1qyx5hpCxx
         ezvuFiboc6K6BXBj5cKYU9K6xY7MuZtoJAFRHwN5OiNPpkkt0XWdA+VxmEtlDkDfHrbm
         dIiVRV6OOE01HPV1mIkKtRmmeRyqZwu97lvA+Cv7ZFans2Xt4uGXy+O1RbPnYelXnev6
         YX0CYSbT4w4SpbvVpPnK9tSSQiV/5uH7/HE3QU1H+P7BF2asms926M3Rol9u67OThoON
         sh8w==
X-Gm-Message-State: APjAAAWeboHSjIAK5Lidj8CpWr8nD8frM65tgYr5NLAYI1muBl2EqwRX
        WdUULX2h1/BbIZnP3x1WB59UyO8J93BeIw==
X-Google-Smtp-Source: APXvYqyixA7Xx1pSEYvofZyFL5jm06L8/9C10nI7bNIeqb/s7AW9ST6VT7MUyAfZlpSIMh5sqjOP7w==
X-Received: by 2002:ac8:1656:: with SMTP id x22mr13362114qtk.108.1570745143348;
        Thu, 10 Oct 2019 15:05:43 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id c185sm3748794qkg.74.2019.10.10.15.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 15:05:42 -0700 (PDT)
Date:   Thu, 10 Oct 2019 18:05:41 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Daniel Axtens <dja@axtens.net>
Cc:     patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191010220541.nhjqttziomdna7kv@chatter.i7.local>
Mail-Followup-To: Daniel Axtens <dja@axtens.net>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <871rvkuvpy.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <871rvkuvpy.fsf@dja-thinkpad.axtens.net>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 08:38:49AM +1100, Daniel Axtens wrote:
>Hi Konstantin,
>
>tl;dr: I think a git-to-email bridge is a good step. I'm not sure why
>patchwork would be the thing to build it on top of, and I'm worried that
>it would slow us both down. I'm very open to being convinced though.

In very broad terms, I chose patchwork because:

1. in people's minds patchwork.kernel.org already deals with patches and 
   mailing lists, so it seems to be a logical place for such tool to 
   live
2. it's already built on top of a powerful web system (django), and we 
   already have it up and running, so this wouldn't require setting up 
   Yet Another Web Framework Service


I will readily admit that both of these assertions are pretty tenuous.

>If I understand correctly, you're using Patchwork as:
>
>> - user creates an account (which requires a mail confirmation)
>
> a) an identity provider, and

Well, rather as a tool that already has account management which 
includes email confirmation at some point.

> b) a way to integrate with existing concepts of a project and keep
>    metadata about them in 1 place

Yes.

> c) a handy tool for getting previous series by a given user.

Yes, it's convenient to already have that user's previously submitted 
series readily available.

> d) a 'trusted' source of email.

Well, this part isn't really that important. Rather, it's a tool where, 
to have an account, one must confirm email delivery.

>Is that right? I just ask because this idea seems a long way from what
>Patchwork traditionally does. That's not necessarily bad, I just want to
>make sure I understand, and that if you get funding you're not tying
>yourself to a platform that doesn't suit your needs.

Well, in my mind patchwork:

1. already deals with patches and series, including knowing how to do 
   diff highlights and all the fancy stuff
2. will hopefully gain ability to do interdiffs in the future, so if 
   someone submits a series revision, they can see what actually changed 
   before their previous submission and their new attempt
3. already has a lot of knowledge around git, mboxes, formats, etc.

This, of course, is not to say that patchwork is where this *must* 
happen, but I think it would be *nice* if this is where this happens. :)

>I'm particularly curious about Patchwork as (a) an identity
>provider. You wrote:
>
>> - user creates an account (which requires a mail confirmation)
>
>This seems like "optional centralising" on Patchwork - it becomes a
>central identity provider but it's optional in that you can just send
>email directly if you prefer.

Right, this is a tool to help people allergic to CLI (or who do this 
infrequently enough that they can never remember all the steps, and oh 
my god, why isn't there a web tool to hold my hand?).

>If you're going to do 'lightweight' centralisation like that, why not do
>it on a platform that already understands git? It's really easy to
>extract the information you describe in (c) just by querying the
>patchwork API. You don't need to actually integrate into patchwork, or
>be logged in, to do that. You lose the ability to load any git remote,
>but if you have a git remote that isn't github or gitlab, you probably
>already have a good email flow (e.g. if you repo is on kernel.org).
>
>If you really want to use Patchwork as an identity provider, rather than
>a forge, could we just teach Patchwork how to be an identity broker, and
>then build things separately, authenticating through Patchwork to
>confirm a user's identity? That means you could build in whatever
>language you like and, critically, run on whatever deployment schedule
>you want. You could also get much better isolation that way, which would
>be good - I don't want an RCE in the git library to allow someone to
>wipe out all patchwork data, for example.

Well, ve hawe vays of prewenting that (e.g. by transitioning git calls 
into their own selinux domain which cannot talk to databases). 

>> I know this is a pretty big RFE, and I would like to hear your thoughts
>> about this. If there is general agreement that this is doable/good idea,
>> I may be able to come up with funding for this development as part of
>> the overall tooling improvement proposal.
>
>As I said up top, I'm not opposed to this per se. I think a git-to-email
>bridge is a good step. I'm just confused as to why patchwork would be
>the thing to build it on top of, and I'm worried about how you'd deploy
>and update this extended Patchwork. I'm very open to being convinced
>though.

Generally, I think patchwork, as a web application that already deals 
with patches and series is a convenient place for this tool to live, 
that's basically the extent of my thinking. For sure, it can exist as a 
separate tool, but then I'd have to set up and maintain that separate 
tool in addition to patchwork, as opposed to just patchwork.

Best,
-K
