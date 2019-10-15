Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6235C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9272E2067B
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571164676;
	bh=2n1QPJ9+wsX+90Eam6hDrj/Clcvhyd3UndJCk8XgdzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DEDy7QUravUPtwE6b4xlx2DZg6ag9eEBkqkCoaXKYV79/MnMNJn6sNBLYFVdokoTr
	 XyIXuZcTi+sDW/okRQmAu9XoOrl1UxUmWR0MOx5efltHs2yWRYIRUURoaQcyoXAx+C
	 Nrx0kD8nP8E1shleowfCCwHhFCrA1kBIkgrbsnq4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729346AbfJOSh4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 14:37:56 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40699 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfJOSh4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 14:37:56 -0400
Received: by mail-qk1-f193.google.com with SMTP id y144so20134964qkb.7
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SknjRA9Ao+FbL08gMkKZrS0vJw7jk28JLULmLntlS9s=;
        b=b0hREZspxSJkBL4Q6iW7tutoXHceS+ox7a/TbznDoG9nTg4Yg+aS21M2i7CJ8KoPrj
         0Mc68RAQdb83k+ETp38HEoepJWFqPGzZ5Kmtym+gcw+x9O9lgwC1aT6cvIwmdZR0E0Ys
         4kVWl7cUBWzAcdCBhfeGTmhpajYIinW1QFHFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SknjRA9Ao+FbL08gMkKZrS0vJw7jk28JLULmLntlS9s=;
        b=C8wXLCtjhK8Npdl2Ra5hs1VPaFGgXIOruqqvUDjj3cLxBpIgPZ63p+mCpeVqjUKcpS
         4g9+fi6sR+/ZXvETBQ94V5fg40a8VCiD50e/X/M4JSy/LRdWiz8AEg4q6MdOicbF76Js
         5JnspmgEp0izwqzS+FopP5gLN58oqSKv2L2VizR6RbnuZEw/phnGZjq1BCUV5GUvSa4P
         pC8sVDTTn8gwvcz9Sxw9X9jpX0UAqe2GUIhC6EgYoeiMM+dhJdrqBM4SUJl//vw3cUm8
         PET8t+oEj27SCBJaQ2tI2PC/i49S8ivCzLoIxYfciUU9aLzxYJYY3fzU4EkoHwgfJc3Y
         +FtQ==
X-Gm-Message-State: APjAAAXzmqsAJ8H4+37P3PaH/HkNJILxUP2fZyarLkvNta607rsWJYTZ
        P7tKOzd+ggeB9KqY04oGr68/6XpFFA0=
X-Google-Smtp-Source: APXvYqxUMrMJowuu4R4sbnTh0jnKDtmLohEbgY0o2NStLt+LtR07/gMAHUiGnKEbQz2oRM/DeGqXDQ==
X-Received: by 2002:a37:6648:: with SMTP id a69mr36151536qkc.154.1571164674654;
        Tue, 15 Oct 2019 11:37:54 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id v4sm9301984qkj.28.2019.10.15.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 11:37:53 -0700 (PDT)
Date:   Tue, 15 Oct 2019 14:37:52 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191015183752.GB5473@chatter.i7.local>
References: <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 09:08:17PM +0200, Han-Wen Nienhuys wrote:
>It is true that Gerrit at Google runs on top of Borg (Gerrit-on-Borg 
>aka. GoB),
>
>1) there is no real concern about Cgit's scalability.
>2) the borg deployment has no relevant magical sauce here.
>
>To 1) : Konstantin was worried about performance implication on git
>notes.  The git-notes command stores data in a single
>refs/notes/commits branch. Gerrit actually uses notes (the file
>format) as well, but has a single notes branch per review, so
>performance here is not a concern when scaling up the number of
>reviews.

Well, it's true that notes use a single ref by default, but the actual 
file structure is similar to git/objects:

  A notes ref is usually a branch which contains "files" whose paths are 
  the object names for the objects they describe, with some directory 
  separators included for performance reasons.

So, if you are creating a note for commit abcdefg, a new file will be 
created in the refs/notes/commits named ab/cd/efg or something similar.  
That is why "performance reasons" are mentioned in the sentence above, 
because as more notes are added, more and more processing power will be 
required to generate tree hashes. Granted, you have to have tens of 
thousands of notes before this even approaches a concern, but past a 
certain point performance will start taking a hit.

>To 2) : Google needs special magic sauce, because we service hundreds
>of teams that work on thousands of repositories. However, here we're
>talking about just the kernel itself; that is just a single
>repository, and not an especially large one.  Chromium is our largest
>repo, and it is about 10x larger than the linux kernel.

Kernel isn't a single repository -- most maintainers have their own fork 
or multiple. Git.kernel.org is now over a thousand repositories (mostly 
forks of the kernel).

>Git is a tool built to exchange code and diffs. It seems natural to
>build a review solution on top of Git too. Gerrit is also built on top
>of git, and stores all metadata in Git too, ie. you can mirror review
>data into other Gerrit instances losslessly.

As I see it, there are the following things that would make Gerrit a 
difficult proposition:

1. A gerrit instance would introduce a single source of failure, which 
   is something many see as undesirable. If there's a DoS attack, Google 
   can restrict access to their Gerrit server to limit the requests to 
   only come from their corporate IP ranges, but kernel.org cannot do 
   the same, so anyone relying on gerrit.kernel.org cannot do any work 
   while it is unavailable.
2. There is limited support for attestation with Gerrit. A change 
   request can contain a digital signature, but any comments surrounding 
   it do not. It would be easy for the administrator of the gerrit 
   instance to forge a +1 or +2 on a CR making it look like it came from 
   the maintainer or the CI service (in other words, we are back to 
   explicitly trusting the infrastructure and IT admins).
3. There is no email bridge, only notifications. Switching to gerrit 
   would require a flag-day when everyone must start using it (or stop 
   participating in kernel development).

I am not sure any of these can be fixed.

>Building a review tool is not all that easy to do well; by using
>Gerrit, you get a tool that already exists, works, and has significant
>corporate support. We at Google have ~11 SWEs working on Gerrit
>full-time, for example, and we have support from UX research and UI
>design. The amount of work to tweak Gerrit for Linux kernel
>development surely is much less than building something from scratch.
>
>Gerrit has a patchset oriented workflow (where changes are amended all
>the time), which is a good fit to the kernel's development process.
>Linus doesn't like Change-Id lines, but I think we could adapt Gerrit
>so it accepts URLs as IDs instead.
>
>There is talk of building a distributed/federated tool, but if there
>are policies ("Jane Doe is maintainer of the network subsystem, and
>can merge changes that only touch file in net/ "), then building
>something decentralized is really hard. You have to build
>infrastructure where Jane can prove to others who she is (PGP key
>signing parties?), and some sort of distributed storage of the policy
>rules.
>
>By contrast, a centralized server can authenticate users reliably and
>the server owner can define such rules.  There can still be multiple
>gerrit servers, possibly sponsored by corporate entities (one from
>RedHat, one from Google, etc.), and different servers can support
>different authentication models (OpenID, OAuth, Google account, etc.)

How would multiple Gerrit servers operate if they are backed by 
different authentication models? Something like a replication plugin 
would require that each of these instances are fully trusted sources of 
truth. I am not sure Red Hat would be happy to fully trust a replication 
stream coming from its direct market competitors, especially if they are 
in a position to forge identities.

Or do you mean they are separate instances and a maintainer would pick 
where to host their subsystem? But then, if they pick Google's gerrit 
system, how would engineers from China be able to participate?

Generally, unless there is a way to run Gerrit without explicitly 
trusting the infrastructure and admins, I will be in strong opposition 
to choosing it as the solution.

-K
