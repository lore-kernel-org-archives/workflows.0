Received: from mta0.migadu.com (out-194.mta0.migadu.com [91.218.175.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F4C3845DC
	for <workflows@vger.kernel.org>; Sun, 23 Aug 2026 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787500691; cv=none; b=S7vzteJQu3F6EMq2Cn+EBjBmfg20Yo/YzdTN1YCDSPdiMBxWKYP8yTn6R0ZPx09XZFUAG9XDbUL67vEYWR0sxu3RiZxKBM0GByx5k3YaTD+xT+MVSCTRcwhlQUkm2OqvvOhvCx8zXrVEROR0HFnoGal7dRtDRSXINrKVlTY7+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787500691; c=relaxed/simple;
	bh=KyYEFiaplUX1+FT41+Zr80qnwqNbDWUgKZSbnVYSy+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq+JkUyheoJY1AVckImb31+tkxxNu01sOoFShEMB8hrQBgTzXF77qX5aguBSfrufdMU/ZTD179z4TeBpmvxOtBy3ihyMTJXv6wEbgqe/TrPyTkjdp6Cm/W4JZTDcuiU9itsrRPGVoReZmsrCEGd0TrIBCfT+dTd8F8/tqa/So5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dm6oYOFJ; arc=none smtp.client-ip=91.218.175.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dm6oYOFJ"
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KyYEFiaplUX1+FT41+Zr80qnwqNbDWUgKZSbnVYSy+U=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787500686; v=1; x=1788105486;
 b=dm6oYOFJUxEUPynAQM0gVSnqLYH6c+M77HYH+/DCRH+3/uLsKlBWJFf1+HxpAxWA0ipsiM+W
 dJtY/Ll33rGTXkw/dNgw4NxDVmMQjNOhhPiI49470P3uCkF4oBbPvc0XdPrUQpjmgAJRnB7mEX/
 Dv9YjRcKzOUO2699/6Hxlan3aHVZo58KS49ApcYpzMUAuyqtlWryIW6wEm4FnbEhT1CFdk0Q6YL
 XwK0N+tp7fHdm5TkY+xGUT2Y048/GY0vFjDDOJDSmpaLFSlOPTu9ugt1JOxxV2AaJZ5ZbHTd6FZ
 QAEk7c5RuksUcBDsanc9tT/pzcKItpZsL7VOEtTw+800w==
X-Envelope-To: workflows@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 8e63290d184e8428;
	Sun, 23 Aug 2026 15:57:56 +0000
X-Mizu-Trace-ID: 8e63290d184e8428
X-Migadu-Flow: FLOW_OUT
Date: Sun, 23 Aug 2026 23:57:49 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [Issue] sphinx: incorrect high-lighting
Message-ID: <aosYfdfH6Z7ai5M2@wyuan.org>
References: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>

On Sun, Aug 23, 2026 at 05:14:20PM +0200, Manuel Ebner wrote:
> I think in the documentation is some incorrect auto high-lighting.
> 
> https://docs.kernel.org/process/deprecated.html
> 
> Line 272:
> > when such a struct was in unions, structs of structs, etc).
> with 'struct was' bold.
> 
> Line 358:
> > alone in a struct or is part of a union. These are disallowed by the C99
> with 'struct or' bold as well.
> 
> Other files have the same issue:
> E.g.: https://docs.kernel.org/process/adding-syscalls.html
> 
> Unfortunately I don't know how to fix this.

Hi Manuel,

I think we can just add "or" and "was" to Skipidentifiers, so that it
won't be treated as C identifiers.

--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -51,7 +51,7 @@ Skipnames = [ 'for', 'if', 'register', 'sizeof', 'struct', 'unsigned' ]
 # when following struct/union/enum/typedef keywords.
 # Example: "a simple struct that" in workqueue.rst should not be marked as code.
 #
-Skipidentifiers = [ 'that', 'which', 'where', 'whose' ]
+Skipidentifiers = [ 'or', 'that', 'was', 'which', 'where', 'whose' ]
 
 #
 # Many places in the docs refer to common system calls.  It is

But I find more words needs to be added when looking at
process/adding-syscalls.rst. Adding the falsely highlighted words one by
one may not be a perfect solution, since it could potentially affect
other places where those words should actually be highlighted. So I'm
not quite sure what the best approach is either now.

Thanks.
