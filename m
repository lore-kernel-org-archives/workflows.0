Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E413DCA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 21:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDB0921855
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 21:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfKAVaq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 17:30:46 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:33634 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726023AbfKAVaq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Nov 2019 17:30:46 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xA1LUalB012278
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 1 Nov 2019 17:30:37 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 870E1420456; Fri,  1 Nov 2019 17:30:36 -0400 (EDT)
Date:   Fri, 1 Nov 2019 17:30:36 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Bjorn Helgaas <helgaas@kernel.org>, Eric Wong <e@80x24.org>,
        Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Subject: Re: Lyon meeting notes
Message-ID: <20191101213036.GA10609@mit.edu>
References: <20191029222629.GA19318@dcvr>
 <20191029231313.GA124865@google.com>
 <20191101200755.h7gyt63rgwyxuqbd@pure.paranoia.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101200755.h7gyt63rgwyxuqbd@pure.paranoia.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 01, 2019 at 04:07:55PM -0400, Konstantin Ryabitsev wrote:
> The argument was that attempts to sneak in malicious code while
> pretending to be someone else would be quickly discovered, because any
> significant code contribution requires back-and-forth and if the "From"
> address is spoofed, then the real developer would quickly point out that
> they are not the actual author of the code.
> 
> My counter-argument is that history proves that we can't trust humans to
> recognize maliciously misspelled domains. If you receive a submission
> like this:
> 
> From: Konstantin Ryabitsev <konstantin@linuxfoudnation.org>
> 
> you will need to pay very close attention to that "d" and "n" to realize
> that it didn't actually come from me.

The other caution I'd raise here about why signing individual commits
might not be the panacea we might hope it would be is that the vast
majority of kernel developers don't today have cryptographic
identities, and we are constantly welcoming new developers to kernel
development.

Even if we did have a way to get new ED25519 keys signed for all of
these new developers, knowing their identity says nothing about how
much they are (or should be) trusted.

Consider that any sufficiently well-resourced actor who really wants
to sneak in malicious code, especially when we consider how much
zero-day exploits are worth on the open market, will be quite willing
to establish a "legend" for a developer.  The "developer" might submit
a dozen cleanup patches, all of which are good, and genuninely improve
the kernel --- and it will be the 13th or the 31st submit that will
have the malicious change hidden in it.  The fact that it is signed by
a key that had previously signed 30 patches says nothing about how
good the 31st patch will be.

For bonus style points, the patch might have something which claims to
be the application of a Coccinelle semantic patch --- and maybe in the
V1 and V2 version of the patch series, it was in in fact a Coccinelle
patch, but in the v3 patch, that's where malicious code was slipped
in, and since V2 had received a Reviewed-by, and it was supposedly an
automatically generated Coccinelle patch, no one took a close look and
noticed that the v3 version of the patch was different from the v2
version....

There are certainly ways we could try to make this sort of thing
harder; we can have tools that verify that the Coccinelle script
mentioned in the commit description actually matches with what the
commit changes.  And we could also have tools which flags deltas
between the Vn and Vn+1 version of a patch, especially after the Vn
version of the patch has gotten a reviewed-by.  It's just that none of
these fixes have anything to do with digital signed commits.

	      	    	 	     	- Ted
