Return-Path: <SRS0=I4mM=YL=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D3CCA9ECB
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 05:52:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3755820820
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 05:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbfJRFwh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 01:52:37 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:52128 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727399AbfJRFwg (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 18 Oct 2019 01:52:36 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 661071F4C3;
        Fri, 18 Oct 2019 03:25:16 +0000 (UTC)
Date:   Fri, 18 Oct 2019 03:25:16 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Cc:     meta@public-inbox.org
Subject: workflow problems and possible public-inbox solutions
Message-ID: <20191018032516.GB29290@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

It seems like there's a bunch of problems the workflows@vger
list is trying to solve.  Some can be solved independently
of others.

Here's a summary of them and where items in
https://public-inbox.org/TODO list can be possible solution
(I'm not claiming it can solve everything :P)


1. vger deliverability problems to major mail providers

(NNTP|public-inbox) => POP3 bridge, since all major providers
support importing mail from POP3.

 https://public-inbox.org/meta/20160411034104.GA7817@dcvr.yhbt.net/

Locally-run NNTP -> mail fetchers can also work, but requires
more effort to setup.


2. attestation of messages

Self-publishing "Sent Mail" folders via NNTP or git,
(similar to Certificate Transparency):
https://lore.kernel.org/workflows/20191010192852.wl622ijvyy6i6tiu@chatter.i7.local/

This would provide redundancy, too; and it's probably more
usable and learnable than GPG :P



3. patch series evolution tracking

Further optimize searching and linkification for patches and
blob OIDs.

public-inbox can already search based on pre/post-image OIDs
(dfpre:/dfpost:) and use that recreate blobs from a series of
patches.

Future: Arbitrary diffs can be generated off recreated blobs.
--interdiff output can be parsed and searched on.

Some proposed solutions to make --range-diff output more
search-friendly, too:

  https://public-inbox.org/git/b9fb52b8-8168-6bf0-9a72-1e6c44a281a5@oracle.com/
  ("email as a bona fide git transport")

  https://public-inbox.org/git/20191017121045.GA15364@dcvr/
  ("range-diff: show old/new blob OIDs in comments")



4. secret exchanges for embargoed issues

No idea, really; not my department :P

It would be good if all messages in the exchange can be
published and mirrored once the embargo is lifted, though.



5. bug tracking

public-inbox already learned to parse and apply patches; so
parsing a debbugs-like language could be done, too.  Maybe
public-inbox can be optimized to improve searching on
"Fixes: $COMMIT_OID" in trailers until we decide on other
parts of the grammar.


Maybe some other stuff, too (feel free to add)
Thanks for reading.
