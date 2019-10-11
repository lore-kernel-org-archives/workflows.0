Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42158C4360C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 02:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14AD221BE5
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 02:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfJKCaN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 22:30:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbfJKCaN (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 22:30:13 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B281B2054F;
        Fri, 11 Oct 2019 02:30:11 +0000 (UTC)
Date:   Thu, 10 Oct 2019 22:30:10 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development
 processes
Message-ID: <20191010223010.4545b74d@gandalf.local.home>
In-Reply-To: <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
References: <20190912120602.GC29277@pure.paranoia.local>
        <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
        <20190930202451.GA14403@pure.paranoia.local>
        <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
        <20191008165155.GA30571@chatter.i7.local>
        <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 10 Oct 2019 22:16:42 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> 
> Oh, hey, change of plans -- looks like I *will* be going to Lyon after

Nice.

> all. I think sitting down together for a semi-formal meeting sounds
> like a good idea, considering all the active discussions happening
> lately. Should we hash out a tentative agenda about topics that we
> should and shouldn't cover? Who should be in attendance?

I'd like to be there. (I'll be in Lyon)

-- Steve

