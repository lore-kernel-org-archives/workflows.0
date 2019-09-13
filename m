Return-Path: <SRS0=s0xN=XI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31870C4CEC5
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 12:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 022ED2084F
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 12:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="byVG+JOi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfIMMP0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 13 Sep 2019 08:15:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44268 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfIMMP0 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 13 Sep 2019 08:15:26 -0400
Received: from pendragon.ideasonboard.com (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DAFC33A;
        Fri, 13 Sep 2019 14:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568376924;
        bh=ZO1XqBU/0ltD/T3Etk/6QuedgVrJABZu1JYmWuo1SWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=byVG+JOiBnhoESltfle+yBskrpVpf4l/1QgLD/WRz7CgxTWflCmPpyrop4d+UUsEi
         Ijt4j2gFaCvFp1Odouea1lMnVYGoO7sISEuUUolkdqTQ8Xm5DazIO038BjguhHl6Pt
         4H/ili0oqfF5CtCC1V3vYql21+Yr0DP+Bnq1J/1E=
Date:   Fri, 13 Sep 2019 15:15:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Message-ID: <20190913121516.GI29992@pendragon.ideasonboard.com>
References: <1811089.yxvLMk49Ug@kreacher>
 <20190913113753.GG29992@pendragon.ideasonboard.com>
 <CAMuHMdWKzZ3skZwqKRFURQkS9F2CCt+DD88XdMaCGJ3+vjn+Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWKzZ3skZwqKRFURQkS9F2CCt+DD88XdMaCGJ3+vjn+Lg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Sep 13, 2019 at 02:02:18PM +0200, Geert Uytterhoeven wrote:
> On Fri, Sep 13, 2019 at 1:38 PM Laurent Pinchart wrote:
> > On Fri, Sep 13, 2019 at 10:22:20AM +0200, Rafael J. Wysocki wrote:
> > > 3. Integration with git
> > >
> > >   (b) Link tags pointing back to it should be added automatically to git
> > >       commits created from patches tracked by it.
> >
> > In addition to a link, should the tag message contain a copy of the
> > cover letter for the patch series ?
> 
> When the patch has a (lore) link tag pointing to its email submission, the
> cover letter is one more click away, isn't it?

It is, but it's nice to save that click if it has no cost :-) Storing
cover letters in tags makes it easy to reuse them when submitting new
versions, that's my main personal use case. Being able to read cover
letters offline is another interesting benefit of storing them in tags.

-- 
Regards,

Laurent Pinchart
