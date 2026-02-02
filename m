Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9385C3033E8;
	Mon,  2 Feb 2026 20:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064811; cv=none; b=F4Ca5LcGU0Vp467w9rKpYl2mI+NSGdFShUyXqzG9ecL+Vna814yfDqAkFaN7k7ZeavJ9CCz86w+b/7EttmsQAwRv8Pri2ZLGoCJPSVqsWwTT1Oj1aEqhwSmRmQn/85Odvpwhy+sJ1Pc5XVHW2bisSosHzXu+OXzp7bcushJHHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064811; c=relaxed/simple;
	bh=q9l0pUOHU8wWTK8ZB9Sq1yC0pVovR+SVkoVQLO1XG9I=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=M7I9PeEHYimT9mGJe9Y/N1Bs5cRXizkHv9Ha1aw8eHTJyF46eKTXczTFQpZtbCWOkCWhJKhyvIaCADFNy8gcf0utDPXHMSxcoIwvK79fcMEnBe9hlMgZB2ToQe0ssACjFUfogEDz/My3KFry/yUhXU22ocPuToO09Qrcj7MY82Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tx4pKBRI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tx4pKBRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1341C116C6;
	Mon,  2 Feb 2026 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770064811;
	bh=q9l0pUOHU8wWTK8ZB9Sq1yC0pVovR+SVkoVQLO1XG9I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=tx4pKBRIAhkbrcPnuVi/NdB4Fev4MvTkir3/D3oi6MO/qhOaH9bzsbUlyEQdR/WoE
	 R46fD4WitKX9UvSlhxi43gb4Y/xdveoPaJ9aI2vc0O4X7E4anhftXtMwtEk8kH/agF
	 XkVjCELHyiLh/O0ouuuGuWMMoGV7vkS5A7HBRR5E=
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] docs: maintainer-pgp-guide.rst: updated a kernel.org
 link
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Amitabh Srivastava <amitabh@amidevlab.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amitabh Srivastava <amitabh@amidevlab.com>
In-Reply-To: <20260202193755.41863-1-amitabh@amidevlab.com>
References: <20260202193755.41863-1-amitabh@amidevlab.com>
Date: Mon, 02 Feb 2026 15:40:06 -0500
Message-Id: <177006480695.901069.1641199463436529014@lemur>
X-Mailer: b4 0.15-dev-90360

On Tue, 03 Feb 2026 01:07:27 +0530, Amitabh Srivastava <amitabh@amidevlab.com> wrote:
> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
> 
> docs: process: maintainer-pgp-guide.rst: updated the http link for
> 'add the kernel.org UID to your key'. Added SPDX-License-Identifier
> to fix checkpatch.pl warning.

Your Signed-off-by should be at the bottom of the commit message, not at 
the top.

Other than that, no objections, but it requires a v2, I think.

-- 
KR

