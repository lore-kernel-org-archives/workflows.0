Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2433D6471;
	Fri,  8 May 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258351; cv=none; b=AwEjEcPL/Kw81YXLYWzH/CCkUG7CUKh3baf8I8VzTyCpgR2RuRRCocqwacjStvE91mUAAIZmsTVWdgwmb15zAHHeDzsiTx5FtDqQ2y1oaTeS1dAE/E7qtzRo+hy9G21me4/waXWDZ/InS1XQQsyH+pOqRbPoSYaZ0dwok64w4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258351; c=relaxed/simple;
	bh=q6k5Oh0K5QycBkcQBFIrZQHNDdFaD3msFtXgp/nz9mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U//EDvejvoEFwS5OOGQ0COOE4zq+HL8RJqEbHG4LVH2eXias2y/BDeNgGPADB4VqZ3UOP40oqrmx6CShLpBbZyCxMvFp/EXojwAfaVti8S9tzRYhfzg9qRVz34OeTDD1gWKCIaJUXKR20Nw+wsGgr3vDpdXXxNm5jAl+UXyNTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=DnAdRSJi; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="DnAdRSJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778258348; bh=DR7AdvxgyTTca330lS6EBoaCYRYIAttkm8UI6kl1vMc=;
	h=From:Message-ID:From;
	b=DnAdRSJie+xf85iJ//X/tH53LvUh7wYDJex9c0EqMCXil8rXAF0U2BguQ8xzAfTc/
	 4NhlC2YzUtiIrlN0l2GozcByWFkjk1m2vKDPd37xwf3/WstL6sX41X7KOHlvrztU+w
	 GBFnKAnirIC+MEksW7CsOvjehswUnASfcXjWDT+4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1FDE8C0C24;
	Fri, 08 May 2026 18:39:08 +0200 (CEST)
Date: Fri, 8 May 2026 18:39:07 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, leon@kernel.org,
        security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <af4RqzO_VHYAqcHf@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <2026050801-semifinal-expulsion-9af6@gregkh>
 <af4IW_ycR2RpAjhy@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af4IW_ycR2RpAjhy@1wt.eu>

Greg,

does this addition on top of the current patch address your concerns ?

--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -88,6 +88,14 @@ can be easily exploited, representing an imminent threat to many users.  Before
 reporting, consider whether the issue actually crosses a trust boundary on such
 a system.

+**If you resorted to AI assistance to identify a bug, you must treat it as
+public**. While you may have valid reasons to believe it is not, the security
+team's experience shows that bugs discovered this way systematically surface
+simultaneously across multiple researchers, often on the same day. In this
+case, do not publicly share a reproducer, as this could cause unintended harm;
+just mention that one is available and maintainers might ask for it privately
+if they need it.
+
 If you are unsure whether an issue qualifies, err on the side of reporting
 privately: the security team would rather triage a borderline report than miss
 a real vulnerability.  Reporting ordinary bugs to the security list, however,
@@ -102,7 +110,7 @@ affected subsystem's maintainers and Cc: the Linux kernel security team.  Do
 not send it to a public list at this stage, unless you have good reasons to
 consider the issue as being public or trivial to discover (e.g. result of a
 widely available automated vulnerability scanning tool that can be repeated by
-anyone).
+anyone, or use of AI-based tools).

 If you're sending a report for issues affecting multiple parts in the kernel,
 even if they're fairly similar issues, please send individual messages (think

If so I can resend with it.

Thanks,
Willy
