Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FDEC4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 21:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32C9B20B7C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 21:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="k9m3n7kc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfJJViz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 17:38:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45739 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfJJViy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 17:38:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id r1so3298158pgj.12
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 14:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
        bh=8xgfUwjfe/nD4WfET4OMXLFDsiQML+0y6KCSKxRl2bQ=;
        b=k9m3n7kcucIZ+pjdwRjH0KO7jS4nKApjauJ1uMY892X9m8d/PJezttNVtSvQ7YKIZK
         tY7jxLXvCjKg+pSrUyk37j0pSOHytTmnTqnNMS7QSzyHT+QM0mdDLNn062cZ5YrOjHPg
         Cj2W5IigNRGECVKpDCEckZoZCwdEWhBF04Ino=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=8xgfUwjfe/nD4WfET4OMXLFDsiQML+0y6KCSKxRl2bQ=;
        b=SzWA/LbNrI5DAi0ngETlNvx+SWXf3cTi3bNylc9+TY3guSZ/8FqTtb+NYK9jzfMewL
         +NxRw+rZ8dQcUp1ApLoy7b8OnRADXpjVzcc2yIzvgdbJEZFRgupPfb+ZS/TXCsyO4i59
         8XwnioLamlMqBPqmhE4tytYWsI3CPhrfzamsnVOgg7SKws5Buweevu4ol7Wg6OOn/7t/
         egM/yh8VOZqvkfoJldWFLgIPrtSlKkZz2EoqL0FB2Ki9ESrfhyLNlMEdTLpFdOC9G8uE
         ba7u3fCqC+VGZjvmbZ/R9thCLkHoqyRkkQ6D3FvEoMS6WpJMai/qeoJjLavyEIQJp+LZ
         WlfA==
X-Gm-Message-State: APjAAAU2goVOiBaLroLanZmoRrjs9SpKjxklDh0MLGcVi8cpBl95J+xJ
        ieV0HKN5/WqMYKB9Q3MLbSKDLLabQzs=
X-Google-Smtp-Source: APXvYqwkmpZS4+StzLxoB3oXh3R5XE6dPIntGnXjtgiCSFYF8VXs0oPHcOSWL8kZlNQr9RtzTRx7/Q==
X-Received: by 2002:a62:3082:: with SMTP id w124mr12329392pfw.191.1570743533621;
        Thu, 10 Oct 2019 14:38:53 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id y6sm7572117pfp.82.2019.10.10.14.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 14:38:52 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
In-Reply-To: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
Date:   Fri, 11 Oct 2019 08:38:49 +1100
Message-ID: <871rvkuvpy.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

tl;dr: I think a git-to-email bridge is a good step. I'm not sure why
patchwork would be the thing to build it on top of, and I'm worried that
it would slow us both down. I'm very open to being convinced though.

> I would like to propose a new (large) feature to patchwork with the goal 
> to make the process of submitting a patch easier for newbies and people 
> generally less familiar with patch-based development. This was discussed 
> previously on the workflows list: 
> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
>
> How I envision this would work:
>
If I understand correctly, you're using Patchwork as:

> - user creates an account (which requires a mail confirmation)

 a) an identity provider, and

> - they choose a "submit patch" option from the menu
> - the patch submission screen has a succession of screens:
>
>   1. a screen with a single field allowing a user to paste a URL to 
>      their fork of the git repository. Once submitted, patchwork does a 
>      "git ls-remote" to attempt to get a list of refs and to verify that 
>      this is indeed a valid git repository
>
>   2. next screen asks the user to select the ref to work from using the 
>      list obtained from the remote. Once submitted, patchwork performs a 
>      `git clone --reference` to clone the repository locally using a 
>      local fork of the same repo to minimize object transfer. This part 
>      requires that:
>        a. patchwork project is configured with a path to a local fork, 
>           if this feature is enabled for a project

 b) a way to integrate with existing concepts of a project and keep
    metadata about them in 1 place

>        b. that fork is kept current via some mechanism outside of 
>           patchwork (e.g. with grokmirror)
>        c. there is some sanity-checking during the clone process to 
>           avoid abuse (e.g. a sane timeout, a tmpdir with limited size, 
>           etc -- other suggestions welcome)
>
>   3. next screen asks the user to pick a starting commit from the log.  
>      Once submitted, patchwork generates the patch from the commit 
>      provided to the tip of the branch selected by the user earlier,
>      using git format-patch.
>
>   4. next screen asks the user to review the patch to make sure this is 
>      what they want to submit. Once confirmed, patchwork performs two 
>      admin-defined optional hooks:
>
>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
>        b. a sanity check hook (e.g. checkpatch.pl)
>
>   5. if sanity checking is defined, next screen shows the output of the 
>      sanity check hook, asking confirmation to proceed.
>
>   6. next screen shows the user three fields:
>
>        a. title of the patch/series
>        b. cover letter for the patch/series
>        c. message-id of the previous patch revision (can be picked from 
>           the list of previously submitted series by this user -- 
>           patchwork should have them already)

 c) a handy tool for getting previous series by a given user.

>        d. number of the revision (can be auto-filled if previous field 
>           is provided) and other tags to include in []
>
>   7. next screen shows final review of what would be sent out to the 
>      list (and cc's, if the hook to get cc's is defined and returned any 
>      results). Once submitted, patchwork sends the patch/series using 
>      patchwork's envelope-from and the user's own email in the From: 
>      header.

 d) a 'trusted' source of email.

Is that right? I just ask because this idea seems a long way from what
Patchwork traditionally does. That's not necessarily bad, I just want to
make sure I understand, and that if you get funding you're not tying
yourself to a platform that doesn't suit your needs.

I'm particularly curious about Patchwork as (a) an identity
provider. You wrote:

> - user creates an account (which requires a mail confirmation)

This seems like "optional centralising" on Patchwork - it becomes a
central identity provider but it's optional in that you can just send
email directly if you prefer.

If you're going to do 'lightweight' centralisation like that, why not do
it on a platform that already understands git? It's really easy to
extract the information you describe in (c) just by querying the
patchwork API. You don't need to actually integrate into patchwork, or
be logged in, to do that. You lose the ability to load any git remote,
but if you have a git remote that isn't github or gitlab, you probably
already have a good email flow (e.g. if you repo is on kernel.org).

If you really want to use Patchwork as an identity provider, rather than
a forge, could we just teach Patchwork how to be an identity broker, and
then build things separately, authenticating through Patchwork to
confirm a user's identity? That means you could build in whatever
language you like and, critically, run on whatever deployment schedule
you want. You could also get much better isolation that way, which would
be good - I don't want an RCE in the git library to allow someone to
wipe out all patchwork data, for example.

> I know this is a pretty big RFE, and I would like to hear your thoughts 
> about this. If there is general agreement that this is doable/good idea, 
> I may be able to come up with funding for this development as part of 
> the overall tooling improvement proposal.

As I said up top, I'm not opposed to this per se. I think a git-to-email
bridge is a good step. I'm just confused as to why patchwork would be
the thing to build it on top of, and I'm worried about how you'd deploy
and update this extended Patchwork. I'm very open to being convinced
though.

Regards,
Daniel

