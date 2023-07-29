Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A2EEB64DD
	for <workflows@archiver.kernel.org>; Sat, 29 Jul 2023 00:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbjG2AWo convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Jul 2023 20:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbjG2AWn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Jul 2023 20:22:43 -0400
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616602680;
        Fri, 28 Jul 2023 17:22:42 -0700 (PDT)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay02.hostedemail.com (Postfix) with ESMTP id 9B12312061F;
        Sat, 29 Jul 2023 00:22:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 9739432;
        Sat, 29 Jul 2023 00:22:37 +0000 (UTC)
Message-ID: <a19576f73036e772225140bb54f433caf0097e4f.camel@perches.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
From:   Joe Perches <joe@perches.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Date:   Fri, 28 Jul 2023 17:22:36 -0700
In-Reply-To: <20230728-egotism-icing-3d0bd0@meerkat>
References: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
         <20230726130318.099f96fc@kernel.org>
         <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
         <20230726133648.54277d76@kernel.org>
         <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
         <20230726145721.52a20cb7@kernel.org> <20230726-june-mocha-ad6809@meerkat>
         <20230726171123.0d573f7c@kernel.org>
         <20230726-armless-ungodly-a3242f@meerkat>
         <1b96e465-0922-4c02-b770-4b1f27bebeb8@lunn.ch>
         <20230728-egotism-icing-3d0bd0@meerkat>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9739432
X-Stat-Signature: 7gkuanj5xoc7qcjfcfz36obxgeao5xs4
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/mOlvdfqFchiId5QJNtKS3kzhjO8vsu4s=
X-HE-Tag: 1690590157-822710
X-HE-Meta: U2FsdGVkX1+FNPSwB11j+R1wv5Pxe7vaiubW5Wi1tA+AoCaaqbhADgPa2JldVgvi5mt27T8OmwOyKQxChZuxVniWz70LwwPoYgW26IU9AbNFvBrSIh4SlJBrqRhFksqSA3bOCkUMWppnpofJV7wsu8AHEmyvRtyc9jLQWnZkbBfHiHihBeyh8XvyAlG/Ir6eSWq0Ohs+VstIxoVmS7OPIfvMQxSMbzCRM71dnHHqbmISNhdjpTLUK5ztQeQyr64Pxdq8q0X9tNDSs+MsiwPDl74QyrF71UABKIeckzzZhGqXfsKbqfP7Uiy41EVDg1VnDULDt4fiB2MVPenvPk78HSflzxegK8s736AuJOdUBchWDnYWqk83m01FrWt9wJSM
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 2023-07-28 at 16:29 -0400, Konstantin Ryabitsev wrote:
> On Thu, Jul 27, 2023 at 01:00:15PM +0200, Andrew Lunn wrote:
> > > Think as if instead of being Cc'd on patches, they got Bcc'd on them.
> > 
> > And how does reply work? I assume it would only go to those in To: or
> > Cc: ? Is there enough context in the headers in a reply for the system
> > to figure out who to Bcc: the reply to?
> 
> I have actually solved a similar problem already as part of a different
> project (bugbot). We associate a set of additional addresses with a thread and
> can send any thread updates to those addresses.
> 
> It would require a bit more effort to adapt it so we properly handle bounces,
> but effectively this does what you're asking about -- replies sent to a thread
> will be sent out to all addresses we've associated with that thread (via
> get_maintainer.pl). In a sense, this will create a miniature pseudo-mailing
> list per each thread with its own set of subscribers.
> 
> I just need to make sure this doesn't fall over once we are hitting
> LKML-levels of activity.
> 

How about whenever a single mailing list like
	linux-patches@vger.kernel.org
gets new 0/n without an in-reply-to header and m/n patches with
only the single in-reply-to header of an 0/n patch or simply a
single patch without an in-reply-to header, the cc list is
automatically generated from a tool like get_maintainer and a
From: <sender> line is added if necessary to the message body
and the email forwarded to all cc's and linux-patches is removed
from the email?

I believe that would help solve most correctness of recipient
list issues and then the linux-patches list would not need
further involvement.

