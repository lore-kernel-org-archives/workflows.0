Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E02D739D;
	Sun, 16 Nov 2025 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763296722; cv=none; b=g+xP6jpRnALycjiakbTUraLSfReFUkzn1k5egpYXuvqM+v0ZPqicoQ+Bk1jewE5C/mKRTEzcpJbph1mQRaw0uXZN4g6Qi7a7c/xuoSZ9R50RS3GdRqU7qcmAJkYsSN4+rHA4OcwxbV29pmZIhZB4zsz8ivjNqXQJjV9CTE90cCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763296722; c=relaxed/simple;
	bh=GiW03M8iojDViAigRp4OG4dI9nEQRJyRQ16v6DkaYBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3bV2A7qt/F4LXMT9V3Ej1oWgIAMhTu7mYuyebar2b/PGWSDkkw4vFgXF2SuyHIvDTG77p4LW+j8fP2bRhCcOiDxzMJMQ8vDoUgWGj2WCqJ5wYqGgGsz7y918oR6sAlMi7qaO1fXe1EeE9q82y6jWEI2Q/tD33KA5CpyMQJvkuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBY1hlpS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBY1hlpS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A7BC4CEFB;
	Sun, 16 Nov 2025 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763296721;
	bh=GiW03M8iojDViAigRp4OG4dI9nEQRJyRQ16v6DkaYBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hBY1hlpSZFdUg7rHQuS6QbIH+HFncDpeJoQF72yeWWOX4kPFBoRBJ4e8sLEpC+XNN
	 DkPtVI7rTLjGgOEIaS44AjkHDqtB9QgxDiXjcIW348qNbV236kR7RVmEmN95Wpvbul
	 Op2tBdT+de/LcERcJFS2tTIKwg7/DiVjhe/XlhW7AEUE38kZq8CPbCD+WkS+rWBDmy
	 XS+RmPCEEjzu/dt2XAtYP7pQUACUV51V6kTwBkemK/80Wh94vYZkQ2gsiCUTY+zz38
	 nZm2w5t9j1haayqaL0HPy/dDEcQWj1/LBtKnTnwUZW7H8IYtaeGb6kQHT2tcB5LV2T
	 eEtfrxG+Kd+6w==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net,
 Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
 ksummit@lists.linux.dev
Subject:
 Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
Date: Sun, 16 Nov 2025 13:38:35 +0100
Message-ID: <2804290.mvXUDI8C0e@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <877bvqan70.ffs@tglx>
References:
 <20251114183528.1239900-1-dave.hansen@linux.intel.com>
 <20251115140746.6a3acfd5@batman.local.home> <877bvqan70.ffs@tglx>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Sunday, November 16, 2025 12:30:27 AM CET Thomas Gleixner wrote:
> On Sat, Nov 15 2025 at 14:07, Steven Rostedt wrote:
> > On Sat, 15 Nov 2025 14:05:56 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> >> As Dave responded to Luis, although that is a good idea, it's out of
> >> scope for this document (for now).
> >
> > I should have said it's out of scope for this patch, not document. The
> > point is that what tag to use for this is a separate discussion.
> 
> Which should be held in the context of this patch to make it complete.

I agree, it would be good to get it all done in one go.



