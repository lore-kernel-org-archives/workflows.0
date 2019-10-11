Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4680C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 07:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B486C2084C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 07:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gandi.net header.i=@gandi.net header.b="o7YOfzU9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfJKHMT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 03:12:19 -0400
Received: from mail12.gandi.net ([217.70.182.73]:36103 "EHLO gandi.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726679AbfJKHMT (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 03:12:19 -0400
Received: from diconico07.dev (unknown [IPv6:2001:4b98:beef:a:e921:9c91:35ed:759a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by gandi.net (Postfix) with ESMTPSA id 3F5DC160547;
        Fri, 11 Oct 2019 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gandi.net; s=20190808;
        t=1570777936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RO48PIiW+KklpeKQWwIlrKunkhtmdR0suwZ96ILqUXY=;
        b=o7YOfzU941ZXnFhyXrquRju9+xHxFO8H+uln2hk3H0U6K5FYsxbV6yPb+OEarhBe/EjNDa
        nQTc4G0MXiutvEsGr9hyQYhUDzsEQTzGvu8v4FifhMI+tqg3UqnSESRC9DvMVHGWkthYM7
        vDUfW1SGWYIbBMn659dJISyJZoUw/tOkc5tn97lCMseZW9qCx0rcMMw8qgrm7yDYfCJnAM
        ADmC4nhElEvde/BWMbHRgmTAr3pK4MjyBCnsYF0ciP4OA9q/MLw3Ql1dZpN5gSVmuEKW+X
        nMqmwY/Z1O8EcWfKQEsZd4HMDg+CO9LKiXSws+7yLYZiGxUa9uv3LotpI2EiGQ==
Subject: Re: thoughts on a Merge Request based development workflow
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Eric Wong <e@80x24.org>, Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <20191009222156.nedvmajswb3w3r3c@dcvr>
 <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
 <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net>
 <CACT4Y+aEPnZ=aniEZ4JxNSE21oExX3X0s2-LX+AdGx3Q0v=C4Q@mail.gmail.com>
From:   Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <882d9408-eb8d-0f32-ce7f-7e5f6e8b08fd@gandi.net>
Date:   Fri, 11 Oct 2019 09:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aEPnZ=aniEZ4JxNSE21oExX3X0s2-LX+AdGx3Q0v=C4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 10/10/19 4:21 PM, Dmitry Vyukov wrote:
> On Thu, Oct 10, 2019 at 9:39 AM Nicolas Belouin
> <nicolas.belouin@gandi.net> wrote:
>> On 10/10/19 1:56 AM, Konstantin Ryabitsev wrote:
>>> On Wed, Oct 09, 2019 at 10:21:56PM +0000, Eric Wong wrote:
>>>> One of my long-term visions is to have an agreed upon way to
>>>> have entirely forkable development communities.  Git already
>>>> gave us forkable code repositories.
>>> FYI, this does already exist in the form of Fossil:
>>> https://www.fossil-scm.org/home/doc/trunk/www/index.wiki
>>>
>>> The main reason why we can't really consider it is because it requires
>>> moving away from git, which is a non-starter for anyone.
>>>
>>> -K
>> Maybe the solution is to build such kind of features within git,
>> many proposed solutions with tools over git or using git.
>> A tool over git has the issue of conveying the data and making
>> it non-centralized, whereas a tool using git is non-scalable because
>> of the way git is *currently* storing things.
>> Improving git to make it able to store many more objects (be it in-review
>> commits or previous versions of patches) and then use it to get the kind
>> of features we can envy from fossil.
> Hi Nicolas,
>
> I am trying to imagine how a complete solution based on git could look
> like, but I am failing. It seems that there is a number of problems
> beyond scalability/storage.
> First, that git probably should be orthogonal to the kernel source git
> trees, right? People work with multiple kernel trees, sometimes
> changes migrate, parts of a series can be merged into different trees,
> etc.
This I think can't be helped if going through a Merge/Pull request workflow
as a request will always be seen as a whole applied to a specific tree,
I agree
though the external tool solution might help for tree migration though.
And I
don't really have a solution for these issues.
> Then, do we do a single git where everybody has write access, or
> per-developer git? If we do a global git and everybody has write
> access, this looks somewhat problematic. If we have multiple
> per-developer gits, then it does not solve the whole problem of
> synchronization and data exchange, one can't pull from thousands of
> unknown gits every time.
For this one I thought of per-developer git with a branch per series
with MR discussion attached to the branch on the developer side and on
maintainer/reference tree side a reference indicating a remote MR is in
progress, with only those kind of special refs being writable.

On MR acceptance the discussion/history of branch gets into the maintainer/
reference tree through the merge commit object and gets included
whenever one
pulls from this tree

> Where is this git[s] are hosted?
Wherever the developper/maintainer wants it to be hosted
> What about force pushes?
Well a force-push as per the rule of no changing the commits of a public
branch
end-up as new reference linking to the old one for traceability.
> What about authorization/user identification?
For this one I thought of a X.509 like tree where you need to get your
key/identity signed
by some kind of AC so that you create an account through that AC and can
push on whatever tree
that trust that AC or one of its parent. I thought about a root with two
main branches one for
"Anonymous" kind of registration where you can use something like OpenId
to get identified
and get your matching certificate signed and another one for "Higher
trust" given to e.g Linus
so he can sign his maintainers and so they can also sign sub-maintainers
and so on. Then you can
set-up your repository to trust the root if you want anyone to be able
to push or some sub-AC to
restrict and maybe even a depth restriction to allow a hierarchical work
as done today.
>
> It would be nice to reuse git's persistent storage format and ability
> to push/fetch incremental changes, but we would need to figure out
> answers to these questions. Maybe I am missing something obvious.
> Could you outline how a solution based on git could look like?
> Also in this case git is only a transport layer (like email/SSB), it
> won't solve the application layer (how patches/comments/issues/CI
> results are described, systems that consume, act and present that,
> etc). So building a solid transport, even if we will need to
> reimplement some git functionality, will be a smaller part of the
> overall effort. And building a solid transport layer that will solve
> fundamental infrastructure problems well may be worth it.

Nicolas
