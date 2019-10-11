Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4941DC47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 15:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E1F8206A1
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 15:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfJKP2y (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 11:28:54 -0400
Received: from ms.lwn.net ([45.79.88.28]:39074 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbfJKP2y (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 11:28:54 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D7FEB2E6;
        Fri, 11 Oct 2019 15:28:52 +0000 (UTC)
Date:   Fri, 11 Oct 2019 09:28:51 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>,
        Christian Brauner <christian@brauner.io>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development
 processes
Message-ID: <20191011092851.4747b2c3@lwn.net>
In-Reply-To: <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
References: <20190912120602.GC29277@pure.paranoia.local>
        <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
        <20190930202451.GA14403@pure.paranoia.local>
        <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
        <20191008165155.GA30571@chatter.i7.local>
        <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
        <20191011083057.GA1074413@kroah.com>
        <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
        <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
        <20191011091812.68257184@gandalf.local.home>
        <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
        <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 11 Oct 2019 15:30:29 +0200
Dmitry Vyukov <dvyukov@google.com> wrote:

> For Tue I see for potentially interested people:
> 09:00 - 09:20 Linus keynote
> 11:00 - 12:00 Shuah Office Hours
> 12:20 - 12:55 Rafael talk

16:20-16:55 Jonathan Corbet :)

> Anything else?
> 
> Tue is fine with me, I just did not want to leave it to the last day
> because most likely it will take me a day to digest all info, so I
> will be able to reply something meaningful only the next day. It would
> be good to have some in-person conversations next day as well.
> 
> Tue 14:00-15:00?

I'd like to be there too.

jon
