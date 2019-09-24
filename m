Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E42C432C1
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 01:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14F1F20820
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 01:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392121AbfIXBjV (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 23 Sep 2019 21:39:21 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:38442 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729129AbfIXBjV (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 23 Sep 2019 21:39:21 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id CA5791F463;
        Tue, 24 Sep 2019 01:39:20 +0000 (UTC)
Date:   Tue, 24 Sep 2019 01:39:20 +0000
From:   Eric Wong <e@80x24.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Message-ID: <20190924013920.GA22698@dcvr>
References: <1811089.yxvLMk49Ug@kreacher>
 <20190923162001.GD6005@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923162001.GD6005@mit.edu>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

"Theodore Y. Ts'o" <tytso@mit.edu> wrote:
> One of the things I'd like to add as a strong desire is the ability to
> review patches via web if that's what users would like to do.  There
> are some real benefits for web-based review.  It means that if you
> need to see greater context, it's relatively easy to do this.  It also
> is convenient to be able to see the conversation for a particular hunk
> of code right alongside the code.

I've already started on that with public-inbox; it's not enabled
on lore, yet(*); but public-inbox.org/git can use "git apply"
and dfpre:/dfpost: search prefixes to reconstruct git blobs out
of emailed patches.

For example, a self-rejected patch I posted in 2016:

  https://public-inbox.org/git/20160711210243.GA1604@whir/

If you follow the link at the hunk header offset "+3,7",
it'll bring you to:

  https://public-inbox.org/git/8d27707/s/?b=http-walker.c#n4

  The bottom of that page has a a "debug log:" which tells
  how the blob is reconstructed using the email and pre-existing
  blob.

Since it can recreate blobs using patches, the next step is to
support showing "git diff" against reconstructed blobs with for
arbitrary contexts; but I got side-tracked from that earlier
this year...

(*) lore could configure coderepo associations, but that's a
    bear with the amount of repos kernel.org has...

> It's clear that whatever we do, it needs to be compatible with e-mail.
> That's very clear.  But it would be useful if we can support both the
> e-mail and web-based review.  There have some prototypes that have
> been floated which shows that it is at least possible; perhaps
> imperfectly, but something which provides a bidrectional gateway
> between those who perfer to use e-mail and those that prefer to use a
> web-based UI would be able to do it.

A hacker-oriented a webmail UI could be derived from
public-inbox and completely interoperable with other mail
servers (it would also support SMTP/IMAP, of course).

> There will be many potential kernel contributors who will be used to
> web-based UI's such as those that are available on github.  So while
> remaining e-mail compatible, having some way of allow as many
> operations to be done via web interfaces might help us get some newer
> developers who are more comfortable to living on the web than some of
> us more senior developers who remember when "gopher" was a text-based
> search engine, and not a mascot for the Go programming langauge.  :-)

Unfortunate, but yeah.  Any web-based UIs ought to include some
subtle (or maybe not-so-subtle) hints/pointers towards
cheaper-to-run-and-likely-more-powerful tools and practices.

I can't prove it, but it seems like public-inbox has been
successful at promoting the use of Message-IDs in URLs and
git-send-email :)
