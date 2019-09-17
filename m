Return-Path: <SRS0=+Bhr=XM=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C35C4CECD
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 22:00:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 413EF21852
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 22:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbfIQWAK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 17 Sep 2019 18:00:10 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:49636 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbfIQWAK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 17 Sep 2019 18:00:10 -0400
Received: from 79.184.255.25.ipv4.supernova.orange.pl (79.184.255.25) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 217bef4c40db3bf6; Wed, 18 Sep 2019 00:00:08 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Date:   Wed, 18 Sep 2019 00:00:08 +0200
Message-ID: <6061838.UtofRmrRYF@kreacher>
In-Reply-To: <CAMuHMdW3Nca8S1OcJPPPbxZPOKvoN-5SYE_QR3Kh-ukWFFTuAg@mail.gmail.com>
References: <1811089.yxvLMk49Ug@kreacher> <20190913121516.GI29992@pendragon.ideasonboard.com> <CAMuHMdW3Nca8S1OcJPPPbxZPOKvoN-5SYE_QR3Kh-ukWFFTuAg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Friday, September 13, 2019 2:23:59 PM CEST Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Fri, Sep 13, 2019 at 2:15 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Sep 13, 2019 at 02:02:18PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Sep 13, 2019 at 1:38 PM Laurent Pinchart wrote:
> > > > On Fri, Sep 13, 2019 at 10:22:20AM +0200, Rafael J. Wysocki wrote:
> > > > > 3. Integration with git
> > > > >
> > > > >   (b) Link tags pointing back to it should be added automatically to git
> > > > >       commits created from patches tracked by it.
> > > >
> > > > In addition to a link, should the tag message contain a copy of the
> > > > cover letter for the patch series ?
> > >
> > > When the patch has a (lore) link tag pointing to its email submission, the
> > > cover letter is one more click away, isn't it?
> >
> > It is, but it's nice to save that click if it has no cost :-) Storing
> > cover letters in tags makes it easy to reuse them when submitting new
> > versions, that's my main personal use case. Being able to read cover
> > letters offline is another interesting benefit of storing them in tags.
> 
> Oh, you mean git tags?
> I think Rafael was talking about "Link" tags at the end of patch/commit
> descriptions.
> 
> If a series is merged using a pull request, the cover letter could indeed
> be stored in the git tag description, and included in the merge commit
> description.

Agreed.



